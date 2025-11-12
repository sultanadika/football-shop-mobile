import 'package:flutter/material.dart';
import '../widgets/left_drawer.dart';

class AddNewItemPage extends StatefulWidget {
  const AddNewItemPage({super.key});

  @override
  State<AddNewItemPage> createState() => _AddNewItemPageState();
}

class _AddNewItemPageState extends State<AddNewItemPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _thumbnailController = TextEditingController();
  final _priceController = TextEditingController();
  final _brandController = TextEditingController();
  final _stockController = TextEditingController();

  String _selectedCategory = 'Ball';
  bool _isFeatured = false;
  double _rating = 0;

  final List<String> _categories = ['Ball', 'Boots', 'Shirt', 'Shorts', 'Accessories'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Product")),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [

            //  Name
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Item Name"),
              validator: (value) {
                if (value == null || value.isEmpty) return "Name cannot be empty";
                if (value.length > 120) return "Max 120 characters";
                return null;
              },
            ),
            const SizedBox(height: 16),

            //  Description
            TextFormField(
              controller: _descController,
              decoration: const InputDecoration(labelText: "Item Description"),
              maxLines: 3,
              validator: (value) {
                if (value == null || value.isEmpty) return "Description cannot be empty";
                return null;
              },
            ),
            const SizedBox(height: 16),

            //  Thumbnail URL
            TextFormField(
              controller: _thumbnailController,
              decoration: const InputDecoration(labelText: "Image URL"),
              validator: (value) {
                if (value == null || value.isEmpty) return "Image URL cannot be empty";
                if (!Uri.parse(value).isAbsolute) return "Enter a valid URL";
                return null;
              },
            ),
            const SizedBox(height: 16),

            //  Price
            TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: "Price (Rp)"),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) return "Price cannot be empty";
                final price = int.tryParse(value);
                if (price == null) return "Must be a number";
                if (price < 0) return "Cannot be negative";
                return null;
              },
            ),
            const SizedBox(height: 16),

            //  Category Dropdown
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: const InputDecoration(labelText: "Category"),
              items: _categories.map((String category) {
                return DropdownMenuItem(value: category, child: Text(category));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value!;
                });
              },
            ),
            const SizedBox(height: 16),

            //  Featured Switch
            SwitchListTile(
              title: const Text("Featured Item?"),
              value: _isFeatured,
              onChanged: (value) {
                setState(() => _isFeatured = value);
              },
            ),
            const SizedBox(height: 16),

            //  Rating Slider
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Rating (0–10)"),
                Slider(
                  value: _rating,
                  min: 0,
                  max: 10,
                  divisions: 10,
                  label: _rating.round().toString(),
                  onChanged: (value) {
                    setState(() {
                      _rating = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 🏭 Brand
            TextFormField(
              controller: _brandController,
              decoration: const InputDecoration(labelText: "Brand (optional)"),
            ),
            const SizedBox(height: 16),

            //  Stock
            TextFormField(
              controller: _stockController,
              decoration: const InputDecoration(labelText: "Available Stock"),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) return "Stock cannot be empty";
                final stock = int.tryParse(value);
                if (stock == null) return "Must be a number";
                if (stock < 0) return "Cannot be negative";
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Save button
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _showDialog(context);
                }
              },
              child: const Text("Save Product"),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("New Product Added"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${_nameController.text}"),
            Text("Description: ${_descController.text}"),
            Text("Thumbnail: ${_thumbnailController.text}"),
            Text("Price: ${_priceController.text}"),
            Text("Category: $_selectedCategory"),
            Text("Featured: ${_isFeatured ? 'Yes' : 'No'}"),
            Text("Rating: ${_rating.round()}"),
            Text("Brand: ${_brandController.text.isEmpty ? '-' : _brandController.text}"),
            Text("Stock: ${_stockController.text}"),
          ],
        ),
        actions: [
          TextButton(
            child: const Text("OK"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
