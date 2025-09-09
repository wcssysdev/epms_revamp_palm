letdata = {
    "reset_master_data": {
        "estate": 1,
        "division": 1,
        "block": 1,
        "employee": 1,
        "activity": 1,
        "attendance_type": 1,
        "license_number": 1,
        "ramp": 1,
        "delivery_destination": 1,
        "abw": 1,
        "material": 1,
        "grading": 1,
        "grouping_gang": 1,
        "vendor": 1,
        "crop_type": 1,
        "block_crop_type": 1,
        "harvesting_method": 1,
        "work_type": 1,
        "work_center": 1,
        "measurement_point": 1,
        "confirmation_text": 1,
        "vra_type": 1,
        "absense": 1
    },
    "global": {
        "M_Crop_type_Schema": [//1
            {
                "croptypecode": "BANANA",
                "croptypename": "Banana",
                "description": "Banana",
                "canharvest": "false"
            },
            {
                "croptypecode": "COCONUT",
                "croptypename": "Coconut",
                "description": "Coconut",
                "canharvest": "true"
            }
        ],
        "M_Harvesting_Method_Schema": [// 2
            {
                "mhm_id": 12,
                "mhm_indicator": "K",
                "mhm_abbreviation": "Non-Paid",
                "mhm_description": "Non-Paid",
                "mhm_order_number_flag": "N"
            },
            {
                "mhm_id": 1,
                "mhm_indicator": "M",
                "mhm_abbreviation": "Manual",
                "mhm_description": "Manual",
                "mhm_order_number_flag": "N"
            }
        ],
        "M_Confirmation_Text_Schema": [//3
            {
                "ctext_code": "CT2402140090",
                "ctext_text": "ALLOWANCES(TAKEN IN ORP)"
            },
            {
                "ctext_code": "CT2402140088",
                "ctext_text": "ASS.LF COLLECT"
            }
        ],
        "M_Work_Type_Schema": [//4
            {
                "work_type_id": 1499,
                "work_type_code": "013",
                "work_type_name": "ANGKUT POLYBAG"
            },
            {
                "work_type_id": 1572,
                "work_type_code": "086",
                "work_type_name": "ANGKUT TBS KE PKS BIA"
            }
        ],
        "M_Work_Center_Schema": [//5
            {
                "work_center_id": 14026,
                "work_center_code": "DUMMY",
                "work_center_name": "DUMMY ESTATE A",
                "work_center_company_code": "",
                "work_center_plant_code": "00EA",
                "work_center_estate_code": "",
                "work_center_division_code": ""
            },
            {
                "work_center_id": 14040,
                "work_center_code": "B-005",
                "work_center_name": "ESTATE A DIVISI 1 - BLOK 4-10",
                "work_center_company_code": "",
                "work_center_plant_code": "00EA",
                "work_center_estate_code": "",
                "work_center_division_code": ""
            }
        ],
        "M_Block_Crop_type_Schema": [],//6
        "M_Estate_Schema": [//7
            {
                "estate_id": 51,
                "estate_company_code": "00",
                "estate_code": "EA",
                "estate_name": "ESTATE A",
                "estate_plant_code": "00EA",
                "estate_created_by": "1",
                "estate_created_date": "2025-07-01",
                "estate_created_time": "15:27:04",
                "estate_updated_by": "1",
                "estate_updated_date": "2025-07-01",
                "estate_updated_time": "15:27:04"
            },
            {
                "estate_id": 52,
                "estate_company_code": "00",
                "estate_code": "EB",
                "estate_name": "ESTATE B",
                "estate_plant_code": "00EB",
                "estate_created_by": "1",
                "estate_created_date": "2025-07-01",
                "estate_created_time": "15:27:04",
                "estate_updated_by": "1",
                "estate_updated_date": "2025-07-01",
                "estate_updated_time": "15:27:04"
            }
        ],
        "M_Division_Schema": [/*8*/
            {
                "division_id": 113,
                "division_company_code": "00",
                "division_estate_code": "EA",
                "division_code": "1",
                "division_name": "Division 1",
                "division_valid_from": "2012-07-01",
                "division_valid_to": "9999-12-31",
                "division_created_by": "1",
                "division_created_date": "2025-06-10",
                "division_created_time": "16:03:13",
                "division_updated_by": "1",
                "division_updated_date": "2025-06-10",
                "division_updated_time": "16:03:13"
            },
            {
                "division_id": 114,
                "division_company_code": "00",
                "division_estate_code": "EA",
                "division_code": "2",
                "division_name": "Division 2",
                "division_valid_from": "2012-08-01",
                "division_valid_to": "9999-12-31",
                "division_created_by": "1",
                "division_created_date": "2025-06-10",
                "division_created_time": "16:03:13",
                "division_updated_by": "1",
                "division_updated_date": "2025-06-10",
                "division_updated_time": "16:03:13"
            }
        ],
        "M_Block_Schema": [/*9*/
            {
                "block_id": 3243,
                "block_company_code": "00",
                "block_estate_code": "EA",
                "block_division_code": "P",
                "block_code": "218",
                "block_name": "BLOK 8-32",
                "block_hectarage": "0",
                "block_planted_date": null,
                "block_valid_from": "2020-12-01",
                "block_valid_to": "9999-12-31",
                "block_created_by": "1",
                "block_created_date": "2025-06-16",
                "block_created_time": "14:36:29",
                "block_updated_by": "1",
                "block_updated_date": "2025-06-16",
                "block_updated_time": "14:36:29",
                "block_state": "MATURE",
                "block_is_planted": "1",
                "block_crop_type": "PALM",
                "block_total_palm": "0"
            },
            {
                "block_id": 3244,
                "block_company_code": "00",
                "block_estate_code": "EA",
                "block_division_code": "P",
                "block_code": "219",
                "block_name": "BLOK 8-33",
                "block_hectarage": "0",
                "block_planted_date": null,
                "block_valid_from": "2020-12-01",
                "block_valid_to": "9999-12-31",
                "block_created_by": "1",
                "block_created_date": "2025-06-16",
                "block_created_time": "14:36:29",
                "block_updated_by": "1",
                "block_updated_date": "2025-06-16",
                "block_updated_time": "14:36:29",
                "block_state": "MATURE",
                "block_is_planted": "1",
                "block_crop_type": "PALM",
                "block_total_palm": "0"
            }
        ],
        "M_Employee_Schema": [/*10*/
            
            {
                "employee_id": 645413,
                "employee_code": "00/00EA/0721/1946",
                "employee_name": "IGNATIUS KLAKIK",
                "employee_valid_from": "2024-11-01",
                "employee_valid_to": "9999-12-31",
                "employee_job_code": "HARVESTERS",
                "employee_created_by": "1",
                "employee_created_date": "2025-07-28",
                "employee_created_time": "16:39:11",
                "employee_updated_by": "1",
                "employee_updated_date": "2025-07-28",
                "employee_updated_time": "16:39:11",
                "employee_profile": "ESTATE A",
                "employee_gang_allotment_code": "PN304",
                "employee_vendor": ""
            },
            {
                "employee_id": 645414,
                "employee_code": "00/00EA/0721/1954",
                "employee_name": "DONALD MESAK ALYOHA",
                "employee_valid_from": "2024-11-01",
                "employee_valid_to": "9999-12-31",
                "employee_job_code": "UMUM",
                "employee_created_by": "1",
                "employee_created_date": "2025-07-28",
                "employee_created_time": "16:39:11",
                "employee_updated_by": "1",
                "employee_updated_date": "2025-07-28",
                "employee_updated_time": "16:39:11",
                "employee_profile": "ESTATE A",
                "employee_gang_allotment_code": "KNT01",
                "employee_vendor": ""
            }
        ],
        "M_Vendor_Schema": [/*11*/
            {
                "vendor_id": 357,
                "vendor_code": "1300000000",
                "vendor_name": "CV. ALFARIZ",
                "vendor_created_by": "1",
                "vendor_created_date": "2025-05-20",
                "vendor_created_time": "14:32:37",
                "vendor_updated_by": "1",
                "vendor_updated_date": "2025-05-20",
                "vendor_updated_time": "14:32:37",
                "vendor_plant_code": "00EA"
            },
            {
                "vendor_id": 360,
                "vendor_code": "1300000001",
                "vendor_name": "CV. INDRA PRATAMA",
                "vendor_created_by": "1",
                "vendor_created_date": "2025-05-20",
                "vendor_created_time": "14:32:37",
                "vendor_updated_by": "1",
                "vendor_updated_date": "2025-05-20",
                "vendor_updated_time": "14:32:37",
                "vendor_plant_code": "00EA"
            }
        ],
        "M_Customer_Code_Schema": [],
        "M_Activity_Schema": [
            
            {
                "activity_id": 194277,
                "activity_code": "9187",
                "activity_name": "PREMI MUAT TANAH TIMBUN Â‰¥ 6 KM",
                "activity_uom": "TRP",
                "activity_created_by": "1",
                "activity_created_date": "2025-06-20",
                "activity_created_time": "07:51:33",
                "activity_updated_by": "1",
                "activity_updated_date": "2025-06-20",
                "activity_updated_time": "07:51:33",
                "activity_cost_by_block": "0",
                "activity_cost_by_auc": "0",
                "activity_cost_by_order_number": "1",
                "activity_cost_by_cost_center": "1",
                "activity_block_is_lc": "0",
                "activity_block_is_immature": "0",
                "activity_block_is_mature": "0",
                "activity_block_is_scout": "0",
                "activity_uom_name": "",
                "activity_group_code": "BLANK",
                "activity_is_wbs_required": "f"
            },
            {
                "activity_id": 194278,
                "activity_code": "9188",
                "activity_name": "PREMI MUAT JANGKOS",
                "activity_uom": "TON",
                "activity_created_by": "1",
                "activity_created_date": "2025-06-20",
                "activity_created_time": "07:51:33",
                "activity_updated_by": "1",
                "activity_updated_date": "2025-06-20",
                "activity_updated_time": "07:51:33",
                "activity_cost_by_block": "0",
                "activity_cost_by_auc": "0",
                "activity_cost_by_order_number": "1",
                "activity_cost_by_cost_center": "1",
                "activity_block_is_lc": "0",
                "activity_block_is_immature": "0",
                "activity_block_is_mature": "0",
                "activity_block_is_scout": "0",
                "activity_uom_name": "TON",
                "activity_group_code": "BLANK",
                "activity_is_wbs_required": "f"
            }
        ],
        "M_NP_Material_Schema": [],
        "M_Attendance_Schema": [
            {
                "attendance_id": 132,
                "attendance_code": "C",
                "attendance_desc": "Cuti",
                "attendance_created_by": "1",
                "attendance_created_date": "2025-07-17",
                "attendance_created_time": "15:30:28",
                "attendance_updated_by": "1",
                "attendance_updated_date": "2025-07-17",
                "attendance_updated_time": "15:30:28"
            },
            {
                "attendance_id": 133,
                "attendance_code": "K",
                "attendance_desc": "Kerja",
                "attendance_created_by": "1",
                "attendance_created_date": "2025-07-17",
                "attendance_created_time": "15:30:28",
                "attendance_updated_by": "1",
                "attendance_updated_date": "2025-07-17",
                "attendance_updated_time": "15:30:28"
            }
        ],
        "M_VRA_Schema": [
            {
                "vra_id": 6976,
                "vra_license_number": "",
                "vra_valid_from": "2018-10-30",
                "vra_valid_to": "9999-12-31",
                "vra_created_by": "1",
                "vra_created_date": "2025-07-22",
                "vra_created_time": "12:57:01",
                "vra_updated_by": "1",
                "vra_updated_date": "2025-07-22",
                "vra_updated_time": "12:57:01",
                "vra_order_number": "101200000509",
                "vra_equipment_code": "J72",
                "vra_object_type": "SCB",
                "vra_plant_code": "00EA",
                "vra_meas_unit": "Km",
                "vra_meas_point": "369",
                "vra_equipment": "MILLEAGE"
            },
            {
                "vra_id": 6934,
                "vra_license_number": "",
                "vra_valid_from": "2025-07-09",
                "vra_valid_to": "9999-12-31",
                "vra_created_by": "1",
                "vra_created_date": "2025-07-22",
                "vra_created_time": "12:57:01",
                "vra_updated_by": "1",
                "vra_updated_date": "2025-07-22",
                "vra_updated_time": "12:57:01",
                "vra_order_number": "101200000586",
                "vra_equipment_code": "AJ001",
                "vra_object_type": "STRADA",
                "vra_plant_code": "00EA",
                "vra_meas_unit": "Km",
                "vra_meas_point": "419",
                "vra_equipment": "MILLEAGE"
            }
        ],
        "M_VRA_Type_Schema": [
            {
                "vra_object_type": "BAKHOE_LOA",
                "type_id": 0
            },
            {
                "vra_object_type": "BSC",
                "type_id": 1
            },
            {
                "vra_object_type": "BUS_SCH",
                "type_id": 2
            },
            {
                "vra_object_type": "TRACTOR",
                "type_id": 20
            },
            {
                "vra_object_type": "VIBRATING",
                "type_id": 21
            }
        ],
        "M_Receiving_Point_Schema": [
            {
                "receiving_point_id": 45,
                "receiving_point_code": "A",
                "receiving_point_created_by": "1",
                "receiving_point_created_date": "2025-06-10",
                "receiving_point_created_time": "16:05:00",
                "receiving_point_updated_by": "1",
                "receiving_point_updated_date": "2025-06-10",
                "receiving_point_updated_time": "16:05:00"
            },
            {
                "receiving_point_id": 46,
                "receiving_point_code": "B",
                "receiving_point_created_by": "1",
                "receiving_point_created_date": "2025-06-10",
                "receiving_point_created_time": "16:05:00",
                "receiving_point_updated_by": "1",
                "receiving_point_updated_date": "2025-06-10",
                "receiving_point_updated_time": "16:05:00"
            }
        ],
        "M_Destination_Schema": [
            {
                "destination_id": 29,
                "destination_code": "00M1",
                "destination_name": "ESTATE A",
                "destination_created_by": "1",
                "destination_created_date": "2025-05-27",
                "destination_created_time": "12:48:24",
                "destination_updated_by": "1",
                "destination_updated_date": "2025-05-27",
                "destination_updated_time": "12:48:24"
            },
            {
                "destination_id": 30,
                "destination_code": "00M2",
                "destination_name": "ESTATE B",
                "destination_created_by": "1",
                "destination_created_date": "2025-05-27",
                "destination_created_time": "12:48:24",
                "destination_updated_by": "1",
                "destination_updated_date": "2025-05-27",
                "destination_updated_time": "12:48:24"
            }
        ],
        "M_Material_Schema": [
            
            {
                "material_id": 30686,
                "material_code": "010.001.007",
                "material_name": "Prima Up 480SL",
                "material_uom": "L",
                "material_created_by": "1",
                "material_created_date": "2025-06-10",
                "material_created_time": "16:02:35",
                "material_updated_by": "1",
                "material_updated_date": "2025-06-10",
                "material_updated_time": "16:02:35",
                "material_plant_code": "00EA",
                "material_sloc": "EA01",
                "material_batch": "",
                "material_group": "010",
                "material_type": "Z004"
            },
            {
                "material_id": 30708,
                "material_code": "010.004.004",
                "material_name": "RACUMIN WAX BLOCK 0.0375 BB",
                "material_uom": "KG",
                "material_created_by": "1",
                "material_created_date": "2025-06-10",
                "material_created_time": "16:02:35",
                "material_updated_by": "1",
                "material_updated_date": "2025-06-10",
                "material_updated_time": "16:02:35",
                "material_plant_code": "00EA",
                "material_sloc": "EA01",
                "material_batch": "",
                "material_group": "010",
                "material_type": "Z004"
            }
        ],
        "T_User_Assignment_Schema": [
            {
                "mandor_id": 42835,
                "profile_name": "ESTATE A",
                "mandor_employee_code": "00/00EA/1114/122",
                "mandor_employee_name": "FLORIANUS JEMADU",
                "employee_code": "00/00EA/1124/2542",
                "employee_name": "YUNUS TUALAKA",
                "start_validity": "2025-06-01",
                "end_validity": "9999-12-31",
                "created_by": "1",
                "created_date": "2025-07-30",
                "created_time": "07:26:47",
                "updated_by": "1",
                "updated_date": "2025-07-30",
                "updated_time": "07:26:47"
            },
            {
                "mandor_id": 42836,
                "profile_name": "ESTATE A",
                "mandor_employee_code": "00/00EA/0614/115",
                "mandor_employee_name": "ARISTO MARIO",
                "employee_code": "00/00EA/1220/1690",
                "employee_name": "ZAINUDDIN",
                "start_validity": "2025-06-01",
                "end_validity": "9999-12-31",
                "created_by": "1",
                "created_date": "2025-07-30",
                "created_time": "07:26:47",
                "updated_by": "1",
                "updated_date": "2025-07-30",
                "updated_time": "07:26:47"
            }
        ],
        "M_TPH_Schema": [
            {
                "tph_id": 26667,
                "tph_company_code": "00",
                "tph_estate_code": "EA",
                "tph_division_code": "1",
                "tph_block_code": "001",
                "tph_section_code": "001",
                "tph_code": "EA1001001",
                "tph_valid_from": "2025-05-01",
                "tph_valid_to": "9999-12-31",
                "tph_latitude": "",
                "tph_longitude": "",
                "tph_created_by": "1",
                "tph_created_date": "2025-05-24",
                "tph_created_time": "08:23:58",
                "tph_updated_by": "1",
                "tph_updated_date": "2025-05-24",
                "tph_updated_time": "08:23:58",
                "tph_palm_total": "0"
            },
            {
                "tph_id": 26668,
                "tph_company_code": "00",
                "tph_estate_code": "EA",
                "tph_division_code": "1",
                "tph_block_code": "001",
                "tph_section_code": "002",
                "tph_code": "EA1001002",
                "tph_valid_from": "2025-05-01",
                "tph_valid_to": "9999-12-31",
                "tph_latitude": "",
                "tph_longitude": "",
                "tph_created_by": "1",
                "tph_created_date": "2025-05-24",
                "tph_created_time": "08:23:58",
                "tph_updated_by": "1",
                "tph_updated_date": "2025-05-24",
                "tph_updated_time": "08:23:58",
                "tph_palm_total": "0"
            }
        ],
        "MC_OPH_Card_Schema": [
            {
                "oph_card_id": "A5600",
                "oph_card_division": "5",
                "oph_card_created_by": "1",
                "oph_card_created_date": "2025-05-26",
                "oph_card_created_time": "08:49:09",
                "oph_card_updated_by": "1",
                "oph_card_updated_date": "2025-05-26",
                "oph_card_updated_time": "08:49:09"
            },
            {
                "oph_card_id": "A5599",
                "oph_card_division": "5",
                "oph_card_created_by": "1",
                "oph_card_created_date": "2025-05-26",
                "oph_card_created_time": "08:49:09",
                "oph_card_updated_by": "1",
                "oph_card_updated_date": "2025-05-26",
                "oph_card_updated_time": "08:49:09"
            }
        ],
        "MC_SPB_Card_Schema": [
            {
                "fdn_card_id": "5040",
                "fdn_card_division": "5",
                "fdn_card_created_by": "1",
                "fdn_card_created_date": "2025-05-31",
                "fdn_card_created_time": "13:13:41",
                "fdn_card_updated_by": "1",
                "fdn_card_updated_date": "2025-05-31",
                "fdn_card_updated_time": "13:13:41"
            },
            {
                "fdn_card_id": "5039",
                "fdn_card_division": "5",
                "fdn_card_created_by": "1",
                "fdn_card_created_date": "2025-05-31",
                "fdn_card_created_time": "13:13:41",
                "fdn_card_updated_by": "1",
                "fdn_card_updated_date": "2025-05-31",
                "fdn_card_updated_time": "13:13:41"
            }
        ],
        "M_Uom_Schema": [
            {
                "uom_id": "36",
                "uom_code": "BAG",
                "uom_desc": "Bags",
                "uom_created_by": "1",
                "uom_created_date": "2020-10-16",
                "uom_created_time": "10:11:41",
                "uom_updated_by": "1",
                "uom_updated_date": "2020-10-16",
                "uom_updated_time": "10:11:41"
            },
            {
                "uom_id": "31",
                "uom_code": "BH",
                "uom_desc": "Bunch",
                "uom_created_by": "1",
                "uom_created_date": "2020-09-23",
                "uom_created_time": "22:54:51",
                "uom_updated_by": "1",
                "uom_updated_date": "2020-09-23",
                "uom_updated_time": "22:54:51"
            }
        ],
        "M_Config_Schema": [
            {
                "config_id": 1,
                "company_code": "00",
                "company_name": "BIA INTI AGRINDO",
                "profile_code": "ESTATE A",
                "profile_name": "ESTATE A",
                "estate_code": "EA",
                "estate_name": "ESTATE A",
                "plant_code": "00EA",
                "cutter_distribution_value": 100,
                "carrier_distribution_value": 0,
                "created_by": "admin",
                "created_date": "2019-01-12",
                "created_time": "10:00:00",
                "updated_by": "1",
                "updated_date": "2025-08-06",
                "updated_time": "09:18:08",
                "attendance_default_value": "K",
                "sap_user_id": "S0021990314",
                "sap_password": "Cpi7798#",
                "integration_type": "1",
                "have_internet_connection": "0",
                "attendance_normal_default_value": "K",
                "sap_api_url": "http://10.32.11.54/PRD/",
                "system_is_palm": "t",
                "system_is_coconut": "f",
                "system_is_durian": "f",
                "system_is_rubber": "f",
                "carrier_lf_distribution_value": 0,
                "cutter_lf_distribution_value": 100,
                "daily_overtime_max_limit": "16",
                "additional_settings": "{\"take_picture_oph\":\"N\",\"take_picture_cp1\":\"N\",\"take_picture_cp2\":\"N\",\"take_picture_fdn\":\"N\",\"take_location_oph\":\"N\",\"take_location_cp1\":\"N\",\"take_location_cp2\":\"N\",\"take_location_fdn\":\"N\",\"oph_scan_task\":\"N\",\"oph_scan_card\":\"N\"}",
                "attendance_unattendde_value": "M",
                "attendance_unattended_value": null,
                "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6Ijg4IiwidXNlcm5hbWUiOiJyb2phIiwiaWF0IjoxNzU1MjIzMzMzfQ.4ozONGWLYdKIcj0-pi_6odW51xSoS0NgTRsWyIpEHXA",
                "employee_code": "00/00EA/0812/136",
                "employee_name": "MARTINUS ROJA",
                "user_id": 88,
                "api_root": "http://localhost/epms_bia/api/v1/",
                "login_date": "2025-08-15",
                "login_time": "09:02:13",
                "allowed_attendance_codes_for_work_assignment": [
                    {
                        "allowed_attendance_code": "K"
                    },
                    {
                        "allowed_attendance_code": "KL"
                    },
                    {
                        "allowed_attendance_code": "KT"
                    }
                ],
                "login_device_id": 3506
            }
        ],
        "Roles_Schema": [
            {
                "user_id": 88,
                "user_roles": "harvest_clerk"
            }
        ],
        "T_Attendance_Schema": []
    },
    "harvest_clerk": {
        "T_Harvesting_Plan_Schema": [],
        "Laporan_Panen_Kemarin": [],
        "Laporan_Panen_Kemarin_Persons": [],
        "Laporan_Restan": [],
        "T_ABW_Schema": []
    }
}