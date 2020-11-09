import 'package:flutter/material.dart';
import 'package:tary_awesome_flutter/form_inputs/credit_card_input.dart';
import 'package:tary_awesome_flutter/form_inputs/demo_data.dart';
import 'package:tary_awesome_flutter/form_inputs/dropdown_menu.dart';
import 'package:tary_awesome_flutter/form_inputs/form_mixin.dart';
import 'package:tary_awesome_flutter/form_inputs/form_section.dart';
import 'package:tary_awesome_flutter/form_inputs/separator.dart';
import 'package:tary_awesome_flutter/form_inputs/submitbutton.dart';
import 'package:tary_awesome_flutter/form_inputs/text_input.dart';
import 'package:tary_awesome_flutter/styles.dart';

class InputScreen extends StatefulWidget{

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> with FormMixin {
  Map<String, String> values = {};
  final _formKey = GlobalKey<FormState>();
  CreditCardNetwork _cardNetwork;


  @override
  Widget build(BuildContext context) {

    print(formCompletion);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //backgroundColor: Color(0xfff1f1f1),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Separator(),
                Container(
                   margin: EdgeInsets.all(22),
                  child: FormSectionTitle('title')),
                Flexible(child: Container(
                  margin: EdgeInsets.all(22),
                  //color: Colors.grey.withOpacity(.3),
                  child: _buildText(FormKeys.email, title: "Email", type: InputType.email,)
                  )),

                  Flexible(child: Container(
                  margin: EdgeInsets.all(22),
                  //color: Colors.grey.withOpacity(.3),
                  child: _buildText(FormKeys.city, title: "City", type: InputType.text),
                  )),
                  Flexible(child: Container(
                  margin: EdgeInsets.all(22),
                  //color: Colors.grey.withOpacity(.3),
                  child: _buildText(FormKeys.phone, title: "Phone Number", type: InputType.telephone),
                  )),

                Flexible(child: 
                Container(
                  margin: EdgeInsets.all(22),
                  child: CreditCardInfoInput(
                  key: ValueKey(FormKeys.ccNumber),
                  label: 'Card Number',
                  helper: '4111 2222 3333 4440',
                  cardNetwork: _cardNetwork,
                  onValidate: onItemValidate,
                  onChange: _handleItemChange,
                  inputType: CreditCardInputType.number,
              ),
                ),),

               Flexible(
                child: Container(
                  margin: EdgeInsets.all(22),
                  child: CreditCardInfoInput(
                  key: ValueKey(FormKeys.ccExpDate),
                  label: 'Expiration', 
                  helper: 'MM/YY',
                  onValidate: onItemValidate,
                  inputType: CreditCardInputType.expirationDate,
              ),
                )),

                  Container(
                    margin: EdgeInsets.all(20),
                    child: DropdownMenu(
                    key: ValueKey(FormKeys.country),
                    label: 'Country / Region',
                    options: ['oka','oke','oki','oko','ok'],
                    defaultOption: "ok",
                    onValidate: onItemValidate,
                ),
                  ),
                Flexible(child: Container(
                  // color: Colors.grey.withOpacity(.3), 
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: SubmitButton(
                        isErrorVisible: isFormErrorVisible,
                        child: Text('Continue ...', style: Styles.submitButtonText),
                        percentage: formCompletion,
                        onPressed: () => _handleSubmit(context)),),)),
                        
              ],
            ),
          ),
        ),
      ),
    );
  }

    _handleSubmit(BuildContext context){
       if (_formKey.currentState.validate() && formCompletion == 1) {

         print(values);

        } else
          setState(() {
            isFormErrorVisible = true;
        });
    }

    TextInput _buildText(String key, {String title, bool required = true, InputType type = InputType.text}) {
    title = title ?? _snakeToTitleCase(key);
    print(title);
    // Register the input validity
    // 
    if (!validInputsMap.containsKey(key)) validInputsMap[key] = !required;

    return TextInput(
      key: ValueKey(key),
      helper: title,
      type: type,
      initialValue: _getFormValue(key),
      onValidate: onItemValidate,
      onChange: onItemChange,
      isRequired: required,

    );
  }

    //ValueNotifier<String> _country;

    String _getFormValue(String name) {
    return values.containsKey(name) ? values[name] : "";
  }

    String _snakeToTitleCase(String value) {
    String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
    List<String> words = value.split("_");
    words = words.map((w) => capitalize(w)).toList();
    return words.join(" ");
  }

  @override
  void onItemValidate(String key, bool isValid, {String value}) {

    // update the input validity
    validInputsMap[key] = isValid;
    bool hasChanged = values[key] != value;
    values[key] = value;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        formCompletion = countValidItems() / validInputsMap.length;
        if (formCompletion == 1) isFormErrorVisible = false;
      });
    });
  }

  @override
  //Update cached values each time the form changes
  // or save data on 
  void onItemChange(String key, String value){
   values[key] = value;
   print(values);
  }


  void _handleItemChange(CreditCardNetwork cardNetwork) {
    setState(() => _cardNetwork = cardNetwork);
  }
}