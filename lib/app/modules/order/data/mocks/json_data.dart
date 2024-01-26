import 'package:teste_delivery/app/core/types/type.dart';

List<Json> orders = [
  {
    "order_id": "45590",
    "order_id_store": "12",
    "client_name": "Mariana Oliveira",
    "order_name": "1x X Burger ZYX + 1x Batata média ",
    "status": "Recebido",
    "value": "R\$45,90",
    "delivery_date": "2024-02-26 12:00",
    "address": "Rua Um Dois Três, 123 - Guarujá, SP - CEP 111410-200",
    "items": [
      {
        "name": "Burger ZYX",
        "number": "1",
      },
      {
        "name": "Batata média",
        "number": "1",
      }
    ],
  },
  {
    "order_id": "45590",
    "order_id_store": "12",
    "client_name": "Tiago Oliveira",
    "order_name": "1x X Burger ZYX  ",
    "status": "Concluido",
    "value": "R\$45,90",
    "delivery_date": "2024-02-26 18:00",
    "address": "Rua Um Dois Três, 123 - Guarujá, SP - CEP 111410-200",
    "items": [
      {
        "name": "Burger ZYX",
        "number": "1",
      },
      {
        "name": "Batata média",
        "number": "1",
      }
    ],
  },
  {
    "order_id": "45590",
    "order_id_store": "12",
    "client_name": "Pedro Tesla",
    "order_name": "1x X Burger ZYX + 1x Batata média ",
    "status": "Em preparo",
    "value": "R\$45,90",
    "delivery_date": "2024-02-26 09:00",
    "address": "Rua Um Dois Três, 123 - Guarujá, SP - CEP 111410-200",
    "items": [
      {
        "name": "Burger ZYX",
        "number": "1",
      },
      {
        "name": "Batata média",
        "number": "1",
      }
    ],
  }
];
