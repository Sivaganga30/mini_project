import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _languageController = TextEditingController();

  String _selectedProficiency = 'Fluent';

  List<Map<String, String>> languages = [];

  void _addLanguage() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        languages.add({
          'language': _languageController.text.trim(),
          'proficiency': _selectedProficiency,
        });
        _languageController.clear();
        _selectedProficiency = 'Fluent';
      });
    }
  }

  void _removeLanguage(int index) {
    setState(() {
      languages.removeAt(index);
    });
  }

  @override
  void dispose() {
    _languageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Languages"),
        backgroundColor: const Color(0xFFAD9CD0),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      controller: _languageController,
                      decoration: InputDecoration(labelText: 'Language'),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter a language' : null,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: DropdownButtonFormField<String>(
                      value: _selectedProficiency,
                      items: ['Native', 'Fluent', 'Intermediate', 'Basic']
                          .map((level) => DropdownMenuItem(
                                value: level,
                                child: Text(level),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedProficiency = value!;
                        });
                      },
                      decoration:
                          InputDecoration(labelText: 'Proficiency'),
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.add_circle, color: Colors.green, size: 30),
                    onPressed: _addLanguage,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: languages.isEmpty
                  ? Center(child: Text("No languages added"))
                  : ListView.builder(
                      itemCount: languages.length,
                      itemBuilder: (context, index) {
                        final lang = languages[index];
                        return Card(
                          child: ListTile(
                            title: Text(lang['language']!),
                            subtitle: Text("Proficiency: ${lang['proficiency']}"),
                            trailing: IconButton(
                              icon: Icon(Icons.remove_circle,
                                  color: Colors.red),
                              onPressed: () => _removeLanguage(index),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
