Spree.routes.tags_api = Spree.pathFor('api/v1/tags');

$.fn.tagAutocomplete = function () {
    'use strict';

    this.select2({
        minimumInputLength: 2,
        multiple: true,
        tags: true,
        tokenSeparators: [',', ' '],
        ajax: {
            url: Spree.routes.tags_api,
            datatype: 'json',
            cache: true,
            data: function (params) {
                return {
                    q: {name_cont: params.term},
                    token: Spree.api_key,
                };
            },
            processResults: function (data) {
                return {
                    results: data.tags.map(function (data) {
                        return {
                            id: data.name,
                            text: data.name,
                        };
                    }),
                };
            },
        },
    });
};

$(document).ready(function () {
    $('.tag_picker').tagAutocomplete();
});
