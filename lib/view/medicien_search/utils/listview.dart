import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:need_doctors/models/Drug/DrugListResponse.dart';
import 'package:need_doctors/view/medicien_search/utils/item.dart';

medicienItemList(
    _pagingController,context, isAdmin) {
  return Expanded(
                  child: PagedListView.separated(
                    pagingController: _pagingController,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10.0,
                    ),
                    builderDelegate: PagedChildBuilderDelegate<DrugModelList>(
                      itemBuilder: (context, article, index) {
                        return medicineItem(_pagingController.itemList, isAdmin,
                            index, context, _pagingController);
                      },
                    ),
                  ),
                );
}
