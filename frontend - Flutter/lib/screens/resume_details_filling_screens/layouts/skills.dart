import 'package:flutter/material.dart';

class Skills extends StatefulWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  List<SkillSection> skillSections = [SkillSection()];

  void addSection() {
    setState(() {
      skillSections.add(SkillSection());
    });
  }

  void removeSection(int index) {
    if (skillSections.length > 1) {
      setState(() {
        skillSections.removeAt(index);
      });
    }
  }

  void addSkill(int sectionIndex) {
    setState(() {
      skillSections[sectionIndex].skills.add(TextEditingController());
    });
  }

  void removeSkill(int sectionIndex, int skillIndex) {
    if (skillSections[sectionIndex].skills.length > 1) {
      setState(() {
        skillSections[sectionIndex].skills.removeAt(skillIndex);
      });
    }
  }

  @override
  void dispose() {
    for (var section in skillSections) {
      section.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Skills", style: TextStyle(color: Colors.black)),
        backgroundColor: const Color(0xFFAD9CD0),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            for (int i = 0; i < skillSections.length; i++) ...[
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: skillSections[i].sectionNameController,
                      decoration: const InputDecoration(
                        hintText: 'e.g. Programming Skills',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => removeSection(i),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              for (int j = 0; j < skillSections[i].skills.length; j++)
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: skillSections[i].skills[j],
                        decoration: const InputDecoration(
                          hintText: 'e.g. Python, Java',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove_circle, color: Colors.red),
                      onPressed: () => removeSkill(i, j),
                    ),
                  ],
                ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: () => addSkill(i),
                  icon: const Icon(Icons.add),
                  label: const Text("Add Skill"),
                ),
              ),
              const Divider(thickness: 1),
            ],

            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: addSection,
              icon: const Icon(Icons.add),
              label: const Text("Add New Section"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4B0082),
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SkillSection {
  TextEditingController sectionNameController = TextEditingController();
  List<TextEditingController> skills = [TextEditingController()];

  void dispose() {
    sectionNameController.dispose();
    for (var c in skills) {
      c.dispose();
    }
  }
}
