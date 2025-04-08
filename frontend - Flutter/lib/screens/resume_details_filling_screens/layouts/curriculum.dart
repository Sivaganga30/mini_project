import 'package:flutter/material.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  List<Map<String, TextEditingController>> projectControllers = [];

  @override
  void initState() {
    super.initState();
    addProjectSection();
  }

  void addProjectSection() {
    setState(() {
      projectControllers.add({
        'title': TextEditingController(),
        'description': TextEditingController(),
        'responsibilities': TextEditingController(),
      });
    });
  }

  @override
  void dispose() {
    for (var project in projectControllers) {
      project['title']!.dispose();
      project['description']!.dispose();
      project['responsibilities']!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: ListView(
          children: [
            ...projectControllers.asMap().entries.map((entry) {
              int index = entry.key;
              var project = entry.value;

              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: project['title'],
                        decoration: const InputDecoration(
                          labelText: 'Project Title',
                          hintText: 'e.g., Resume Builder App',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: project['description'],
                        maxLines: 3,
                        decoration: const InputDecoration(
                          labelText: 'Project Description',
                          hintText: 'Brief summary of the project',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: project['responsibilities'],
                        maxLines: 3,
                        decoration: const InputDecoration(
                          labelText: 'Responsibilities',
                          hintText: 'e.g., Developed backend, integrated API',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: addProjectSection,
                icon: const Icon(Icons.add),
                label: const Text('Add Project',style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
