import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/domain/entities/curation.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/products_list_page/product_list_page.dart';

import '../../utils/status.dart';
import 'cubit/curation_detail_page_cubit.dart';

class CurationDetailPage extends StatelessWidget {
  static const String routeName = 'curation_detail_page';
  const CurationDetailPage({super.key, required this.curationId});

  final int curationId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CurationDetailPageCubit>(param1: curationId),
      child: _CurationDetailPage(curationId: curationId),
    );
  }
}

class _CurationDetailPage extends StatelessWidget {
  const _CurationDetailPage({required this.curationId});

  final int curationId;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<CurationDetailPageCubit, CurationDetailPageState>(
      builder: (context, state) {
        if (state.fetchCurationStatus == Status.loading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          );
        }
        Curation curation = state.curation!;
        return Scaffold(
          appBar: AppBar(
            title: Text(curation.name),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.network(curation.imageFileName ?? "",
                            width: 70,
                            height: 70,
                            errorBuilder: (context, error, stackTrace) => Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  width: 70,
                                  height: 70,
                                  child: const Center(
                                    child: Icon(
                                      Icons.map,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              curation.name,
                              style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              curation.curatorName!,
                              style: textTheme.bodyMedium?.copyWith(color: Colors.grey),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              curation.description ?? "",
                              style: textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    context.l10n.home_page_stores,
                    style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Flexible(
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => const SizedBox(height: 8),
                      shrinkWrap: true,
                      itemCount: curation.stores?.length ?? 0,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            context.pushNamed(ProductListpage.routeName,
                                queryParameters: {"curationId": curation.id.toString(), "storeId": curation.stores?[index].id.toString()});
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.network(curation.stores?[index].imageFileName ?? "",
                                        width: 50,
                                        height: 50,
                                        errorBuilder: (context, error, stackTrace) => Container(
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              width: 50,
                                              height: 50,
                                              child: const Center(
                                                child: Icon(
                                                  Icons.store,
                                                  color: Colors.white,
                                                  size: 25,
                                                ),
                                              ),
                                            )),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      curation.stores?[index].name ?? "",
                                      style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
