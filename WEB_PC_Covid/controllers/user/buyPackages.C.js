const express = require('express'),
  router = express.Router();
const Package = require('../../models/user/buyPackage.M');
const PackageDetail = require('../../models/user/packageDetail.M');
const Product = require('../../models/user/product.M');
const Consume = require('../../models/user/consume.M');

let IdPackage = 0;
let quantity;
let options;
let totalP;

router.get('/', async (req, res) => {
  const limit = 3;
  const page = +req.query.page || 1;
  if (page < 0)
    page = 1;
  const offset = (page - 1) * limit;
  const [total, list] = await Promise.all([
    Package.count(),
    Package.page(limit, offset)
  ]);

  const nPages = Math.ceil(total[0].Size / 3);

  const page_items = [];
  for (let i = 1; i <= nPages; i++) {
    const item = {
      value: i,
      isActive: i === page
    };
    page_items.push(item);
  };

  res.render('user/packages/buyPackages', {
    Package: list,
    title: 'Buy packages of necessities',
    active: { buyPackages: true },
    page_items: page_items,
    prev_value: page - 1,
    next_value: page + 1,
    can_go_prev: page > 1,
    can_go_next: page < nPages,
    totalPrice: totalP
  });
});

router.get('/:Id', async (req, res) => {
  const data = await PackageDetail.allByIdPackage(req.params.Id);
  IdPackage = req.params.Id;
  const p = await Package.allByCat(req.params.Id);

  const list = await PackageDetail.allById(req.params.Id);

  for (let i = 0; i < list.length; i++) {
    const NameProduct = await Product.allById(list[i].IdProduct);
    list[i].NameProduct = NameProduct[0].NameProduct;
  }

  p[0].quantity = list.length;

  res.render('user/packages/packageDetail', {
    packageDetail: data,
    Package: p,
    product: list,
    title: 'Details of package',
    active: { buyPackages: true },
  });
});

router.post('/search', async (req, res) => {
  const search = req.body.search;
  const limit = 3;
  const page = +req.query.page || 1;
  if (page < 0)
    page = 1;
  const offset = (page - 1) * limit;
  const [total, list] = await Promise.all([
    Package.countSearch(search),
    Package.loadSearch(search, limit, offset)
  ]);


  const nPages = Math.ceil(total[0].Size / 3);

  const page_items = [];
  for (let i = 1; i <= nPages; i++) {
    const item = {
      value: i,
      isActive: i === page
    };
    page_items.push(item);
  };

  res.render('user/packages/buyPackages', {
    Package: list,
    title: 'Buy packages of necessities',
    active: { buyPackages: true },
    page_items: page_items,
    prev_value: page - 1,
    next_value: page + 1,
    can_go_prev: page > 1,
    can_go_next: page < nPages
  });
});

router.post('/quantity', async (req, res) => {
  options = req.body.options;
  quantity = req.body.quantity;
  
  totalP = 0;
  for (i = 0; i < options.length; i++) {
    const NameProduct = await Product.allById(options[i]);
    totalP += NameProduct[0].Price;
  }

  const data = await PackageDetail.allByIdPackage(IdPackage);
  const p = await Package.allByCat(IdPackage);
  const list = await PackageDetail.allById(IdPackage);

  const limitProduct = p[0].LimitProducts;
  const limitPeople = p[0].LimitPeople;
  for (let i = 0; i < list.length; i++) {
    const NameProduct = await Product.allById(list[i].IdProduct);
    list[i].NameProduct = NameProduct[0].NameProduct;
  }
  req.session.TotalPrice = totalP;

  if (quantity < limitProduct) {
    return res.render('user/packages/packageDetail', {
      packageDetail: data,
      Package: p,
      product: list,
      totalPrice: totalP,
      title: 'Package detail',
      msg: `Number of product above ${limitProduct}!`,
    });
  }

  if (quantity != options.length) {
    return res.render('user/packages/packageDetail', {
      packageDetail: data,
      Package: p,
      product: list,
      totalPrice: totalP,
      title: 'Package detail',
      msg: 'Valid',
    });
  }
  const CountPackage = await Consume.countCondition(IdPackage, req.user.Id);

  if(parseInt(CountPackage[0].Size) >= parseInt(limitPeople))
  return res.render('user/packages/packageDetail', {
      packageDetail: data,
      Package: p,
      product: list,
      totalPrice: totalP,
      title: 'Package detail',
      msg: 'Over limit',
    });
});

router.post('/paynow', async (req, res) => {
  req.session.TotalPrice = totalP;

  res.redirect('/user/pay/payDetail');
});


router.post('/paylater', async (req, res) => {
  const cs = await Consume.all();

  const today = new Date();
  const date =
    today.getFullYear() +
    '-' +
    (today.getMonth() + 1) +
    '-' +
    today.getDate();
  const time =
    today.getHours() +
    ':' +
    today.getMinutes() +
    ':' +
    today.getSeconds();
  const dateTime = date + ' ' + time;

  let consume = {
    IdUser: req.user.Id,
    IdPackage: IdPackage,
    Time: dateTime,
    Price: totalP,
    Status: 'Unpaid',
    CreditLimit: 50000,
  };

  var c = await Consume.add(consume);

  res.redirect('/user/pay');
});

module.exports = router;