import 'package:flutter/material.dart';
import 'package:merchant_app/constants/colors/app_colors.dart';
import 'package:merchant_app/constants/methods/validation_methods.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';

class EditItemView extends StatefulWidget {
  final ShoppingItem shoppingItem;

  const EditItemView({Key? key, required this.shoppingItem}) : super(key: key);

  @override
  State<EditItemView> createState() => _EditItemViewState();
}

class _EditItemViewState extends State<EditItemView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        /// Top Navigation Bar
        Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 64, 16),
          child: const MyNavigationBar(),
        ),

        /// Main content of the page
        Container(
          alignment: Alignment.center,
          child: SafeArea(
            child: Container(
              constraints: const BoxConstraints(minWidth: 900, maxWidth: 1300),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  /// Edit Item Text
                  Text(
                    'Edit Item',
                    key: const Key("edit_item_merchant"),
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber.shade700),
                  ),

                  /// Item Name
                  Text(
                    widget.shoppingItem.name!,
                    key: const Key("item_name_merchant"),
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: infoPageTextColor),
                  ),

                  /// Divider!
                  const SizedBox(
                    width: 1350.0,
                    height: 20.0,
                    child: Divider(
                      color: Color.fromARGB(255, 90, 38, 31),
                    ),
                  ),

                  /// Wrapper to keep everything in center and look nice!
                  Container(
                      constraints:
                          const BoxConstraints(minWidth: 500, maxWidth: 800),
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        /// Item Name Text Field
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text("Item Name"),
                          ),
                          validator: NameFieldValidator.validate,
                        ),

                        /// Item Price Text Field
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text("\$ Item Price"),
                          ),
                          validator: NameFieldValidator.validate,
                        ),

                        /// Item Category Text Field
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text("Item Category"),
                          ),
                          validator: NameFieldValidator.validate,
                        ),

                        const SizedBox(height: 50),

                        /// Description Text Field
                        TextFormField(
                          // controller: bodyText,
                          minLines: 2,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            hintText: 'Description',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                          validator: EmptyFieldValidator.validate,
                        ),

                        const SizedBox(height: 50),

                        /// Edit Item Button
                        Container(
                          padding: const EdgeInsets.fromLTRB(25, 2, 25, 2),
                          child: MaterialButton(
                            key: const Key("edit_item_button_merchant"),
                            onPressed: () {},
                            child: const Text(
                              "Edit Item",
                              style: TextStyle(fontSize: 18),
                            ),
                            minWidth: double.infinity,
                            height: 52,
                            elevation: 24,
                            color: Colors.amber.shade700,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32)),
                          ),
                        )
                      ]))
                ],
              ),
            ),
          ),
        ),

        /// Footer
        const HomePageFooter()
      ],
    );
  }
}
