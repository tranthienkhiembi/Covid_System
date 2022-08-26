const express = require('express'),
  router = express.Router(),
  bcrypt = require('bcrypt'),
  saltRounds = parseInt(process.env.SALT_ROUND),
  userModel = require('../../models/home.M'),
  paymentModel = require('../../models/manager/payment.M'),
  packetModel = require('../../models/manager/packet.M'),
  patientModel = require('../../models/manager/patient.M'),
  managerHistory = require('../../models/user/managerHistory.M'),
  profile = require('../../models/user/profile.M'),
  account = require('../../models/user/account.M');
  userPlace = require('../../models/user/userplace.M'),
  place = require('../../models/user/place.M'),
  consume = require('../../models/user/consume.M'),
  package = require("../../models/user/buyPackage.M");

router.get('/', async (req, res) => {
  const listMana = await managerHistory.all();
  for (i = 0; i < listMana.length; i++) {
    listMana[i].STT = i+1;
    listMana[i].Username = await account.allById(listMana[i].IdManager);
    listMana[i].TimeStart = listMana[i].TimeStart.toISOString().replace(/T/, ' ').replace(/\..+/, '');
    listMana[i].TimeEnd = listMana[i].TimeEnd.toISOString().replace(/T/, ' ').replace(/\..+/, '');
  }


  const consumeOfUser = await paymentModel.getConsume(req.user.Id);
  const consumeOfUserPaid = await paymentModel.getConsumePaid(req.user.Id, 'Paid');
  var isInform = false;
  var inform = "";

  if(consumeOfUserPaid.length === consumeOfUser.length)
  {
    await paymentModel.updateInform({Inform: 0}, req.user.Id);
  }

  const listProfile = await profile.allByCat(req.user.Id);

  if(listProfile[0].Inform > 0)
  {
    isInform = true;
    inform = "Please pay for the package of necessities you purchased";
  }
  
  const historyPackage = await consume.allById(req.user.Id)
  for (i = 0; i < historyPackage.length; i++){
    const pack = await package.allById(historyPackage[i].IdPackage);
    historyPackage[i].NamePackage = pack[0].NamePackage;
    historyPackage[i].STT = i + 1;
  }

  for (t = 0; t < historyPackage.length; t++) {
    historyPackage[t].Time = historyPackage[t].Time.toISOString()
    .replace(/T/, ' ')
    .replace(/\..+/, '');
  }

  const debt = await consume.allByStatus(req.user.Id, 'Unpaid');
  let TotalDebt = 0;
  for (let i = 0; i  < debt.length; i++){
    TotalDebt += debt[i].Price;
  }

  const IdPlace = await userPlace.allById(req.user.Id);

  const Place = await place.allById(IdPlace[0].IdPlace);

  listProfile[0].NamePlace = Place[0].NamePlace;


  for (let index = 0; index < consumeOfUser.length; index++) {
    const user = await patientModel.getOne(consumeOfUser[index].IdUser);
    const packet = await packetModel.getOne(consumeOfUser[index].IdPackage);


    var timeBuy = consumeOfUser[index].Time.toISOString().replace(/T/, ' ').replace(/\..+/, '');
    timeBuy = timeBuy.slice(0, timeBuy.indexOf(" "));

    consumeOfUser[index].STT = index+1;
    consumeOfUser[index].NameUser = user.Name;
    consumeOfUser[index].NamePackage = packet.NamePackage;
    consumeOfUser[index].TimeBuy = timeBuy;
  }
  res.render('user/profile/infor', {
    HistoryManager: listMana,
    profile: listProfile,
    empty: listMana.length === 0,
    empty1: historyPackage === 0,
    title: 'Profile',
    active: { profile: true },
    isInform: isInform,
    inform: inform,
    HistoryPayment: consumeOfUser,
    emptyPayment: consumeOfUser.length === 0,
    historyPackage: historyPackage,
    DebtUser: TotalDebt
  });
});

router.post('/', async (req, res) => {
  const listMana = await managerHistory.all();
  for (i = 0; i < listMana.length; i++) {
    listMana[i].Username = await account.allById(listMana[i].IdManager);
  }

  // Payment check
  const consumeOfUser = await paymentModel.getConsume(req.user.Id);
  const consumeOfUserPaid = await paymentModel.getConsumePaid(req.user.Id, 'Paid');
  var isInform = false;
  var inform = "";

  if(consumeOfUserPaid.length === consumeOfUser.length)
  {
    await paymentModel.updateInform({Inform: 0}, req.user.Id);
  }

  const listProfile = await profile.allByCat(req.user.Id);
  const IdPlace = await userPlace.allById(req.user.Id);

  const Place = await place.allById(IdPlace[0].IdPlace);

  listProfile[0].NamePlace = Place[0].NamePlace;

  if(listProfile[0].Inform > 0)
  {
    isInform = true;
    inform = "Please pay for the package of necessities you purchased";
  }

  for (let index = 0; index < consumeOfUser.length; index++) {
    const user = await patientModel.getOne(consumeOfUser[index].IdUser);
    const packet = await packetModel.getOne(consumeOfUser[index].IdPackage);


    var timeBuy = consumeOfUser[index].Time.toISOString().replace(/T/, ' ').replace(/\..+/, '');
    timeBuy = timeBuy.slice(0, timeBuy.indexOf(" "));

    consumeOfUser[index].STT = index+1;
    consumeOfUser[index].NameUser = user.Name;
    consumeOfUser[index].NamePackage = packet.NamePackage;
    consumeOfUser[index].TimeBuy = timeBuy;
  }

  const newPass = req.body.newPwd;
  const verifyPass = req.body.newPwd2;

  if (verifyPass != newPass) {
    return res.render('user/profile/infor', {
      title: 'Internet Banking',
      msg: 'Password confirm does not match!',
      HistoryManager: listMana,
      profile: listProfile,
      empty: listMana.length === 0,
      title: 'Profile',
      active: { profile: true },
      alert: true,
    });
  }

  const user = await userModel.get(req.user.Username);
  const challengeResult = await bcrypt.compare(newPass, user.Password);

  //Same password
  if (challengeResult)
    return res.render('user/profile/infor', {
      title: 'Internet Banking',
      msg: 'The new password is the same as the old password!',
      HistoryManager: listMana,
      profile: listProfile,
      empty: listMana.length === 0,
      title: 'Profile',
      active: { profile: true },
      alert: true,
    });

  const pwdHashed = await bcrypt.hash(newPass, saltRounds);
  let acc = {
    Username: req.user.Username,
    Password: pwdHashed,
    FirstActive: 1
  };

  await userModel.patchPassAndActive(acc);

  res.render('user/profile/infor', {
    HistoryManager: listMana,
    profile: listProfile,
    empty: listMana.length === 0,
    title: 'Profile',
    active: { profile: true },
    isInform: isInform,
    inform: inform,
    HistoryPayment: consumeOfUser,
    emptyPayment: consumeOfUser.length === 0,
  });
});

module.exports = router;