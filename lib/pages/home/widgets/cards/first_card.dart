import 'package:flutter/material.dart';

class FirstCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.event_note,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Formulário de Recebimento de Viatura',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                        /*Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 0, bottom: 75),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'FATURA ATUAL',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: 'R\$ ',
                                    children: [
                                      TextSpan(
                                          text: '600',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(text: ',50'),
                                    ],
                                  ),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 28,
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: 'Limite disponível',
                                    children: [
                                      TextSpan(
                                          text: ' R\$ 2.200,95',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),*/
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 12, bottom: 12, left: 10, right: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                           
                            
                          ],
                        ),
                        width: 7,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.file_download,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Flexible(
                      child: Text(
                        'Ver Completo',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey[400],
                      size: 25,
                    ),
                  ],
                ),
              ),
              color: Colors.grey[200],
            ),
          ),
        ],
      ),
    );
  }
}
