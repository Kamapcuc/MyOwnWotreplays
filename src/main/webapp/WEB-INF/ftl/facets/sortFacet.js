function SortFacet(controller) {
    this.controller = controller;
    this.sort = this.defaultSort;
    this.order = this.defaultOrder;
    $('.b-replays__sort a').on('click', $.proxy(this.onClick, this));
}

SortFacet.prototype.defaultSort = '${defaultSort.name()}';
SortFacet.prototype.defaultOrder = '${defaultOrder.name()}';

SortFacet.prototype.onClick = function (event) {
    var param = {
        sortType: event.target.id,
        sortOrder: 'DESC'
    };
    if (this.sort == param.sortType && this.order == 'DESC')
        param.sortOrder = 'ASC';

    this.setSelected(param);
    this.controller.reloadData();
};

SortFacet.prototype.getQueryParam = function () {
    var result = [];
    if (this.sort != this.defaultSort)
        result.push('sortType=' + this.sort);
    if (this.order != this.defaultOrder)
        result.push('sortOrder=' + this.order);
    return result.join("&");
};

SortFacet.prototype.setSelected = function (queryParams) {
    if (!queryParams.sortType)
        queryParams.sortType = this.defaultSort;
    if (this.sort != queryParams.sortType)
        $('.b-replays__sort #' + this.sort).removeClass('b-link_active');
    this.sort = queryParams.sortType;
    if (queryParams.sortOrder)
        this.order = queryParams.sortOrder;
    var ref = $('.b-replays__sort #' + this.sort);
    ref.addClass('b-link_active');
    ref.find('.b-sort__dir').html((this.order == 'DESC') ? '↑' : '↓');
};

SortFacet.prototype.setResult = function () {
    //doNothing
};