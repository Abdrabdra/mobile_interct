// ignore_for_file: public_member_api_docs, sort_constructors_first
class TicketModel {
  int id;
  int cost;
  int busId;
  String nomer;
  String image;
  int nomerBileta;
  int row;
  int column;
  String dt;
  String status;
  TicketModel({
    required this.id,
    required this.cost,
    required this.busId,
    required this.nomer,
    required this.image,
    required this.nomerBileta,
    required this.row,
    required this.column,
    required this.dt,
    required this.status,
  });

  @override
  String toString() {
    return 'TicketModel(id: $id, cost: $cost, busId: $busId, nomer: $nomer, image: $image, nomerBileta: $nomerBileta, row: $row, column: $column, dt: $dt)';
  }
}
