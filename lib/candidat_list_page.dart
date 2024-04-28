// candidat_list_page.dart
import 'package:flutter/material.dart';
import 'candidat.dart';
import 'add_candidat_page.dart';

class CandidateListPage extends StatefulWidget {
  @override
  _CandidateListPageState createState() => _CandidateListPageState();
}

class _CandidateListPageState extends State<CandidateListPage> {
  List<Candidat> candidates = [
    Candidat(
      name: 'Zinsou',
      firstName: 'Lionel',
      sex: 'Male',
      party: 'Party D',
      description: 'Lionel Zinsou, né Zinsou-Derlin le 23 octobre 1954 à Paris, est un économiste franco-béninois, ayant fait carrière notamment comme banquier d\'affaires puis comme PDG du fonds d\'investissement européen PAI Partners. Il a été Premier ministre du Bénin de juin 2015 à avril 2016.',
      photo: 'assets/images/lionel.jpeg',
    ),
    Candidat(
      name: 'Talon',
      firstName: 'Patrice',
      sex: 'Male',
      party: 'Party A',
      description: 'Patrice Talon, né le 1ᵉʳ mai 1958 à Ouidah, est un homme d\'affaires et homme d\'État béninois, président de la République depuis le 6 avril 2016. Patrice Talon a fait fortune dans la filière des intrants agricoles dans les années 1980, puis de l\'égrenage du coton au Bénin au cours des années 1990 et 2000.',
      photo: 'assets/images/patrice.jpeg',
    ),
    Candidat(
      name: 'Boni Yayi',
      firstName: 'Thomas',
      sex: 'Male',
      party: 'Party B',
      description: 'Thomas Boni Yayi, né le 1er juillet 1952 à Tchaourou (Bénin), est un homme politique béninois, président de la République du 6 avril 2006 au 6 avril 2016.  Il achève ses études à Paris par un doctorat en sciences économiques. Il devient le conseiller du président Nicéphore Soglo élu en 1991, sur les questions monétaires et bancaires. De 1994 jusqu’à son élection à la présidence béninoise, il dirige la Banque ouest-africaine de développement (BOAD).',

      photo: 'assets/images/yayi.jpeg',
    ),
    Candidat(
      name: 'Ajavon',
      firstName: 'Sébastien',
      sex: 'Male',
      party: 'Party C',
      description: 'Sébastien Ajavon est un homme d’affaires et homme politique béninois né le 19 janvier 1965 à Cotonou. Milliardaire ayant fait fortune dans le secteur agroalimentaire, il est souvent surnommé « le roi du poulet » au Bénin.',
      photo: 'assets/images/ajavonsebas.jpeg',
    ),
  ];

  bool hasNotification = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 32),
            Text(
              'Élections présidentielles',
              style: TextStyle(color: Colors.black),
            ),
            Spacer(),
            Stack(
              alignment: Alignment.center,
              children: [
                Icon(Icons.notifications, color: Colors.black),
                if (hasNotification)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(width: 32),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[350],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('Présidentielle', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Governorship'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('NGDA'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Candidats',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${candidates.length} Candidats',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: candidates.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white, width: 2),
                                image: DecorationImage(
                                  image: AssetImage(candidates[index].photo),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${candidates[index].firstName} ${candidates[index].name}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    candidates[index].description,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  if (candidates[index].description.length > 200)
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text('${candidates[index].firstName} ${candidates[index].name}'),
                                                  content: SingleChildScrollView(
                                                    child: Text(candidates[index].description),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                      child: Text('Fermer'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Text('Read More', style: TextStyle(fontSize: 12)),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddCandidatPage(),
            ),
          ).then((newCandidat) {
            if (newCandidat != null) {
              setState(() {
                candidates.add(newCandidat);
              });
            }
          });
        },
      ),
    );
  }
}