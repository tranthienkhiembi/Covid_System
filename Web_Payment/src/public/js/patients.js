$('#addPatient').click(() => {
    $('#addF0Modal').modal('show');
})
$('#addRelatedPerson').click(() => {
    $('#addRelatedPersonModal').modal('show');
})
$('#seeDetail').click(() => {
    $('#detailPersonModal').modal('show');
})

$(document).ready(function () {
    $('#dtBasicExample').DataTable({
        searching: false,
        paging: false,
        info: false,
    });
    $('.dataTables_length').addClass('bs-select');
});

