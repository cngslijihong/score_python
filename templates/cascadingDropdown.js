var viewModel = {
    grade: ko.observable(),
    grades: ko.observableArray(),
    class: ko.observable(),
    classes: ko.observableArray(),
    exam: ko.observable(),
    exams: ko.observableArray(),
    result: ko.observable()
};
viewModel.gradeSelect = ko.dependentObservable({
    read: viewModel.grade,
    write: function (grade) {
        this.grade(grade);
        $.getJSON('http://localhost:56502/KnockoutJS/CascadingDropdown/Classes/' +
            grade.value, null, function (response) {
            viewModel.classes(response);
        });
        $.getJSON('http://localhost:56502/KnockoutJS/CascadingDropdown/Exams/' +
            grade.value, null, function (response) {
            viewModel.exams(response);
        });
    },
    owner: viewModel
});
viewModel.result = ko.dependentObservable(function () {
    var result = '';
    result += this.country() != undefined ? 'Country: ' + this.country().text + ', ' : '';
    result += this.state() != undefined ? 'State: ' + this.state().text + ', ' : '';
    result += this.city() != undefined ? 'City: ' + this.city().text : '';
    return result;
}, viewModel);

$(function () {
    $.getJSON('http://localhost:56502/KnockoutJS/CascadingDropdown/Grades/',
        null, function (response) {
            viewModel.grades(response);
        });
    ko.applyBindings(viewModel);
});
