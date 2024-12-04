import 'package:flutter/material.dart';
// TaxiBillScreen

class TaxiBillScreen extends StatelessWidget {
  const TaxiBillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final InputDecoration inputDecoration = InputDecoration(
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      suffixIconColor: Colors.grey,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hai Jojo....',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              DateField(
                label: 'Trip Date',
                inputDecoration: inputDecoration,
              ),
              const SizedBox(height: 10),
              DateField(
                label: 'End Date',
                inputDecoration: inputDecoration,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: inputDecoration.copyWith(
                  labelText: 'Vehicle Name',
                  suffixIcon: const Icon(Icons.directions_car),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: inputDecoration.copyWith(
                  labelText: 'Vehicle Number',
                  suffixIcon: const Icon(Icons.directions_car),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: inputDecoration.copyWith(
                  labelText: 'Driver Name',
                  suffixIcon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: inputDecoration.copyWith(
                  labelText: 'Amount',
                  suffixIcon: const Icon(Icons.attach_money),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: inputDecoration.copyWith(
                  labelText: 'Driver Bata',
                  suffixIcon: const Icon(Icons.attach_money),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: inputDecoration.copyWith(
                  labelText: 'Amount Paid',
                  suffixIcon: const Icon(Icons.attach_money),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: inputDecoration.copyWith(
                  labelText: 'Amount Balance',
                  suffixIcon: const Icon(Icons.attach_money),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: inputDecoration.copyWith(
                  labelText: 'Others',
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add submit functionality here albi.......................................

                      //create pdf package should be added here albi.......................................
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DateField extends StatefulWidget {
  final String label;
  final InputDecoration inputDecoration;

  const DateField(
      {super.key, required this.label, required this.inputDecoration});

  @override
  _DateFieldState createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  final TextEditingController _controller = TextEditingController();

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        _controller.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      decoration: widget.inputDecoration.copyWith(
        labelText: widget.label,
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_today),
          onPressed: () => _pickDate(context),
        ),
      ),
    );
  }
}
