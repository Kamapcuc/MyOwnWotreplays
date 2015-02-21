function SortFacet(controller) {
    this.controller = controller;
    this.sort = this.defaultSort;
    this.order = this.defaultOrder;
    $('.b-replays__sort a').on('click', $.proxy(this.onClick, this));
}

SortFacet.prototype = Object.create(AbstractFacet.prototype);
SortFacet.prototype.defaultSort = '${defaultSort.name()}';
SortFacet.prototype.defaultOrder = '${defaultOrder.name()}';

SortFacet.prototype.onClick = function (event) {
    var sort = event.target.id;
    var order = 'DESC';
    if (this.sort == sort && this.order == 'DESC')
        order = 'ASC';
    this.setState(sort, order);
    this.controller.reloadData();
};

SortFacet.prototype.getQueryParams = function () {
    var result = [];
    if (this.sort != this.defaultSort)
        result.push('sortType=' + this.sort);
    if (this.order != this.defaultOrder)
        result.push('sortOrder=' + this.order);
    return result.join("&");
};

SortFacet.prototype.setStateFromUrl = function (params) {
    var sort = (params.sortType) ? params.sortType : this.defaultSort;
    var order = (params.sortOrder) ? params.sortOrder : this.defaultOrder;
    this.setState(sort, order);
};

SortFacet.prototype.setState = function (sort, order) {
    var oldSortType = this.sort;
    this.sort = sort;
    this.order = order;
    if (this.sort != oldSortType)
        $('.b-replays__sort #' + oldSortType).removeClass('b-link_active');
    var ref = $('.b-replays__sort #' + this.sort);
    ref.addClass('b-link_active');
    ref.find('.b-sort__dir').html((this.order == 'DESC') ? '↑' : '↓');
};