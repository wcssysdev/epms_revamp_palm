/*
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
 */

class Vendor {
  final int vendorId;
  final String vendorCode;
  final String vendorName;
  final String vendorPlantCode;

  Vendor({
    required this.vendorId,
    required this.vendorCode,
    required this.vendorName,
    required this.vendorPlantCode,
  });
}
