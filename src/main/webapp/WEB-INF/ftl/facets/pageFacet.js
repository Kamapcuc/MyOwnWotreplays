function PageFacet(controller) {
    this.currentPage = 1;
    this.controller = controller;
}

PageFacet.prototype = Object.create(AbstractFacet.prototype);
PageFacet.prototype.itemsPerPage = ${paginationSize};

PageFacet.prototype.changePage = function (pageNumber) {
    this.currentPage = pageNumber;
    this.controller.reloadData();
};

PageFacet.prototype.getQueryParams = function () {
    var tmp = this.currentPage;
    this.currentPage = 1;
    return (tmp != 1) ? 'page=' + tmp : null;
};

PageFacet.prototype.setStateFromUrl = function (params) {
};

PageFacet.prototype.redraw = function () {
    var data = history.state;
    this.pagesCount = Math.ceil(data.total / this.itemsPerPage);
};