//
//  SearchResultMock.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 20/07/22.
//

import Foundation


let jsonSearchResponse = """
    {
        "site_id": "MCO",
        "country_default_time_zone": "GMT-05:00",
        "query": "fortuner",
        "paging": {
            "total": 562,
            "primary_results": 562,
            "offset": 0,
            "limit": 50
        },
        "results": [
            {
                "id": "MCO927096666",
                "site_id": "MCO",
                "title": "Toyota Fortuner 4x2 ",
                "seller": {
                    "id": 570211167,
                    "permalink": "http://perfil.mercadolibre.com.co/TUC_CALLE134",
                    "registration_date": "2020-05-18T16:38:57.000-04:00",
                    "car_dealer": false,
                    "real_estate_agency": false,
                    "tags": [
                        "franchise",
                        "messages_as_seller"
                    ],
                    "seller_reputation": {
                        "power_seller_status": null,
                        "level_id": null,
                        "metrics": {
                            "cancellations": {
                                "period": "60 months",
                                "rate": 0,
                                "value": 0
                            },
                            "claims": {
                                "period": "60 months",
                                "rate": 0,
                                "value": 0
                            },
                            "delayed_handling_time": {
                                "period": "60 months",
                                "rate": 0,
                                "value": 0
                            },
                            "sales": {
                                "period": "60 months",
                                "completed": 0
                            }
                        },
                        "transactions": {
                            "canceled": 0,
                            "period": "historic",
                            "total": 0,
                            "ratings": {
                                "negative": 0,
                                "neutral": 0,
                                "positive": 0
                            },
                            "completed": 0
                        }
                    }
                },
                "price": 155000000,
                "prices": {
                    "id": "MCO927096666",
                    "prices": [
                        {
                            "id": "1",
                            "type": "standard",
                            "amount": 155000000,
                            "regular_amount": null,
                            "currency_id": "COP",
                            "last_updated": "2022-07-18T13:45:33Z",
                            "conditions": {
                                "context_restrictions": [],
                                "start_time": null,
                                "end_time": null,
                                "eligible": true
                            },
                            "exchange_rate_context": "DEFAULT",
                            "metadata": {}
                        }
                    ],
                    "presentation": {
                        "display_currency": "COP"
                    },
                    "payment_method_prices": [],
                    "reference_prices": [],
                    "purchase_discounts": []
                },
                "sale_price": null,
                "currency_id": "COP",
                "available_quantity": 1,
                "sold_quantity": 0,
                "buying_mode": "classified",
                "listing_type_id": "gold_premium",
                "stop_time": "2022-09-16T04:00:00.000Z",
                "condition": "used",
                "permalink": "https://carro.mercadolibre.com.co/MCO-927096666-toyota-fortuner-4x2-_JM",
                "thumbnail": "http://http2.mlstatic.com/D_778424-MCO50769695953_072022-I.jpg",
                "thumbnail_id": "778424-MCO50769695953_072022",
                "accepts_mercadopago": false,
                "installments": null,
                "address": {
                    "state_id": "TUNPUEJPR1gxMDljZA",
                    "state_name": "Bogotá D.C.",
                    "city_id": "TUNPQ1NVQjUzNzQ4",
                    "city_name": "Suba",
                    "area_code": "",
                    "phone1": ""
                },
                "shipping": {
                    "free_shipping": false,
                    "mode": "not_specified",
                    "tags": [],
                    "logistic_type": null,
                    "store_pick_up": false
                },
                "seller_address": {
                    "id": "",
                    "comment": "",
                    "address_line": "",
                    "zip_code": "",
                    "country": {
                        "id": "CO",
                        "name": "Colombia"
                    },
                    "state": {
                        "id": "CO-DC",
                        "name": "Bogotá D.C."
                    },
                    "city": {
                        "id": "TUNPQ1NVQjUzNzQ4",
                        "name": "Suba"
                    },
                    "latitude": "",
                    "longitude": ""
                },
                "seller_contact": {
                    "contact": "Joaquin M.",
                    "other_info": "",
                    "area_code": "",
                    "phone": "",
                    "area_code2": "",
                    "phone2": "",
                    "email": "",
                    "webpage": ""
                },
                "location": {
                    "address_line": "",
                    "zip_code": "",
                    "subneighborhood": null,
                    "neighborhood": {
                        "id": "TUNPQkxBMTY3ODI",
                        "name": "La Colina Campestre"
                    },
                    "city": {
                        "id": "TUNPQ1NVQjUzNzQ4",
                        "name": "Suba"
                    },
                    "state": {
                        "id": "TUNPUEJPR1gxMDljZA",
                        "name": "Bogotá D.C."
                    },
                    "country": {
                        "id": "CO",
                        "name": "Colombia"
                    },
                    "latitude": 4.726241,
                    "longitude": -74.06655
                },
                "attributes": [
                    {
                        "id": "ITEM_CONDITION",
                        "name": "Condición del ítem",
                        "value_struct": null,
                        "value_id": "2230581",
                        "value_name": "Usado",
                        "values": [
                            {
                                "source": 1,
                                "id": "2230581",
                                "name": "Usado",
                                "struct": null
                            }
                        ],
                        "attribute_group_id": "",
                        "attribute_group_name": "",
                        "source": 1
                    },
                    {
                        "values": [
                            {
                                "struct": null,
                                "source": 1443,
                                "id": "242085",
                                "name": "Sí"
                            }
                        ],
                        "attribute_group_id": "CONFORT",
                        "attribute_group_name": "Confort",
                        "value_id": "242085",
                        "value_name": "Sí",
                        "value_struct": null,
                        "id": "HAS_AIR_CONDITIONING",
                        "name": "Aire acondicionado",
                        "source": 1443
                    },
                    {
                        "attribute_group_name": "Ficha técnica",
                        "id": "BRAND",
                        "name": "Marca",
                        "value_struct": null,
                        "attribute_group_id": "FIND",
                        "value_id": "60297",
                        "value_name": "Toyota",
                        "values": [
                            {
                                "id": "60297",
                                "name": "Toyota",
                                "struct": null,
                                "source": 1443
                            }
                        ],
                        "source": 1443
                    },
                    {
                        "id": "DOORS",
                        "value_name": "5",
                        "value_struct": null,
                        "values": [
                            {
                                "id": null,
                                "name": "5",
                                "struct": null,
                                "source": 1443
                            }
                        ],
                        "attribute_group_id": "FIND",
                        "attribute_group_name": "Ficha técnica",
                        "source": 1443,
                        "name": "Puertas",
                        "value_id": null
                    },
                    {
                        "name": "Motor",
                        "value_id": null,
                        "value_struct": null,
                        "attribute_group_id": "FIND",
                        "id": "ENGINE",
                        "value_name": "2700",
                        "values": [
                            {
                                "id": null,
                                "name": "2700",
                                "struct": null,
                                "source": 1443
                            }
                        ],
                        "attribute_group_name": "Ficha técnica",
                        "source": 1443
                    },
                    {
                        "value_id": "64364",
                        "value_name": "Gasolina",
                        "values": [
                            {
                                "id": "64364",
                                "name": "Gasolina",
                                "struct": null,
                                "source": 1443
                            }
                        ],
                        "attribute_group_name": "Ficha técnica",
                        "source": 1443,
                        "id": "FUEL_TYPE",
                        "name": "Tipo de combustible",
                        "value_struct": null,
                        "attribute_group_id": "FIND"
                    },
                    {
                        "value_name": "55000 km",
                        "values": [
                            {
                                "id": null,
                                "name": "55000 km",
                                "struct": {
                                    "unit": "km",
                                    "number": 55000
                                },
                                "source": 1443
                            }
                        ],
                        "attribute_group_name": "Ficha técnica",
                        "source": 1443,
                        "id": "KILOMETERS",
                        "name": "Kilómetros",
                        "value_id": null,
                        "value_struct": {
                            "number": 55000,
                            "unit": "km"
                        },
                        "attribute_group_id": "FIND"
                    },
                    {
                        "name": "Modelo",
                        "value_id": "2318140",
                        "value_name": "Fortuner",
                        "attribute_group_id": "FIND",
                        "attribute_group_name": "Ficha técnica",
                        "source": 1443,
                        "id": "MODEL",
                        "value_struct": null,
                        "values": [
                            {
                                "id": "2318140",
                                "name": "Fortuner",
                                "struct": null,
                                "source": 1443
                            }
                        ]
                    },
                    {
                        "id": "TRANSMISSION",
                        "name": "Transmisión",
                        "value_name": "Automática",
                        "values": [
                            {
                                "struct": null,
                                "source": 1443,
                                "id": "370876",
                                "name": "Automática"
                            }
                        ],
                        "attribute_group_id": "FIND",
                        "source": 1443,
                        "value_id": "370876",
                        "value_struct": null,
                        "attribute_group_name": "Ficha técnica"
                    },
                    {
                        "value_struct": null,
                        "value_id": null,
                        "value_name": "2.7 Gasolina 4x2",
                        "values": [
                            {
                                "id": null,
                                "name": "2.7 Gasolina 4x2",
                                "struct": null,
                                "source": 1443
                            }
                        ],
                        "attribute_group_id": "FIND",
                        "attribute_group_name": "Ficha técnica",
                        "source": 1443,
                        "id": "TRIM",
                        "name": "Versión"
                    },
                    {
                        "id": "VEHICLE_YEAR",
                        "value_id": null,
                        "value_name": "2018",
                        "values": [
                            {
                                "id": null,
                                "name": "2018",
                                "struct": null,
                                "source": 1443
                            }
                        ],
                        "attribute_group_name": "Ficha técnica",
                        "source": 1443,
                        "name": "Año",
                        "value_struct": null,
                        "attribute_group_id": "FIND"
                    },
                    {
                        "values": [
                            {
                                "id": "370879",
                                "name": "4x2",
                                "struct": null,
                                "source": 1443
                            }
                        ],
                        "attribute_group_id": "SECURITY",
                        "name": "Control de tracción",
                        "value_id": "370879",
                        "value_name": "4x2",
                        "value_struct": null,
                        "id": "TRACTION_CONTROL",
                        "attribute_group_name": "Seguridad",
                        "source": 1443
                    }
                ],
                "original_price": null,
                "category_id": "MCO1744",
                "official_store_id": null,
                "domain_id": "MCO-CARS_AND_VANS",
                "catalog_product_id": null,
                "tags": [
                    "good_quality_picture",
                    "moderation_penalty"
                ],
                "order_backend": 1,
                "use_thumbnail_id": true,
                "offer_score": null,
                "offer_share": null,
                "match_score": null,
                "winner_item_id": null,
                "melicoin": null,
                "discounts": null
            }
        ]

    }
    """

let data = jsonSearchResponse.data(using: .utf8)!

func getDataSearchResult() -> SearchResponse{
    let decoder = JSONDecoder()
    guard let dataSearchResponse = try? decoder.decode(SearchResponse.self, from: data) else {
        return SearchResponse(countryDefaultTimeZone: "", query: "", paging: Paging(total: 0, primaryResults: 0, offset: 0, limit: 0), results: [])
    }
    return dataSearchResponse
}


