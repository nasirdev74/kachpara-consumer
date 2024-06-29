import 'package:flutter/material.dart';

import '../domain/entities/address.dart';

class AddressListItem extends StatelessWidget {
  const AddressListItem({super.key, required this.address, this.deletable = true});
  final Address address;
  final bool deletable;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF2F2F2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.location_on),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(address.name,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            )),
                    Text(address.address),
                  ],
                ),
              ),
            ),
            if (deletable)
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    size: 30,
                  )),
          ],
        ),
      ),
    );
  }
}
