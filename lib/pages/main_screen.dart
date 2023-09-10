import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_segment_button_widget.dart';
import 'package:flutter_application_1/widgets/custom_textformfield_widget.dart';
import '../widgets/appbar_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const String routeName = '/main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController fechaInicio = TextEditingController();
  TextEditingController fechaFinal = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController tittle = TextEditingController();
  String chatGPTResponse = "";

  @override
  Widget build(BuildContext context) {
    Future<void> selectedDate(fecha) async {
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
      );
      if (picked != null) {
        setState(() {
          fecha.text = picked.toString().split(' ')[0].toString();
        });
      }
    }

    return Scaffold(
      appBar: const CustomAppbar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            chatGPTResponse = "Hola, ¿en qué puedo ayudarte?";
          });
        },
        elevation: 10,
        hoverColor: Colors.green,
        hoverElevation: 15,
        tooltip: "Guardar tarea",
        child: const Icon(Icons.save),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 120, vertical: 30),
              child: Form(
                child: GridView.count(crossAxisCount: 2, children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 400,
                        child: CustomTextFormField(
                          controller: tittle,
                          label: "Ingrese el título de su tarea",
                          icon: Icons.task,
                          maxLines: 1,
                          onTap: () {},
                        ),
                      ),
                      const CustomeSegmentButton(),
                      SizedBox(
                        width: 400,
                        child: CustomTextFormField(
                          controller: fechaInicio,
                          label: "Imgrese la fecha de inicio de su tarea",
                          icon: Icons.calendar_today,
                          onTap: () {
                            selectedDate(fechaInicio);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 400,
                        child: CustomTextFormField(
                            controller: fechaFinal,
                            label:
                                "Ingrese la fecha de finalización de su tarea",
                            icon: Icons.calendar_month_sharp,
                            maxLines: 1,
                            isPassword: false,
                            onTap: () {
                              selectedDate(fechaFinal);
                            }),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 420,
                        child: CustomTextFormField(
                          controller: description,
                          label: "Ingrese una breve descripción de su tarea",
                          icon: Icons.description,
                          maxLines: 2,
                          onTap: () {},
                        ),
                      ),
                      SizedBox(
                        width: 420,
                        child: Text.rich(
                          TextSpan(
                            text: "Sugerencias de ChatGPT-3.5: ",
                            children: [
                              TextSpan(
                                text: chatGPTResponse == ""
                                    ? "No hay sugerencias"
                                    : chatGPTResponse,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FilledButton.icon(
                        onPressed: () {
                          if ( description.text == "" ) {
                            setState(() {
                              chatGPTResponse = "Por favor ingrese una descripción";
                            });
                          }
                          else {
                            setState(() {
                              chatGPTResponse = "\n \nHola, de acuerdo a la descripción ingresada, se esta generando una sugerencia con ayuda de ChatGPT-3.5...";
                            });
                          }
                        },
                        icon: const Icon(Icons.graphic_eq_outlined),
                        label: const Text("Generar sugerencias"),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
