import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Question/Model/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/all_questions_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_game_question_config.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';

class AnatomyAllQuestions extends AllQuestionsService {
  static final AnatomyAllQuestions singleton = AnatomyAllQuestions.internal();

  factory AnatomyAllQuestions() {
    return singleton;
  }

  AnatomyAllQuestions.internal();

  @override
  Map<Language, Map<CategoryDifficulty, List<Question>>>
      getAllQuestionsWithLanguages() {
    var questionConfig = AnatomyGameQuestionConfig();
    Map<Language, Map<CategoryDifficulty, List<Question>>> result =
        HashMap<Language, Map<CategoryDifficulty, List<Question>>>();

    addEN(result, questionConfig);
    addRO(result, questionConfig);
    return result;
  }

  void addEN(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      AnatomyGameQuestionConfig questionConfig) {
    var language = Language.en;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Liver:1,2,3:29.2,45", "Mouth:4,2,9:28.1,81.6", "Esophagus:1,8,5:48.6,58.6", "Large intestine:4,2,6:20.5,21", "Small intestine:8,7,1:52.4,19", "Stomach:4,6,7:66,41", "Pharynx:5,2,9:48.6,81", "Gallbladder:6,9,4:31.3,39.6", "Pancreas:2,1,0:50,35.1", "Appendix:2,8,3:35.1,9.6"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Skull:11,8,6:48,97", "Scapula:5,4,3:61.1,80.2", "Rib cage:11,7,0:56,74.1", "Spine:8,10,1:45.9,65.2", "Tibia:5,9,3:51.4,23.6", "Femur:4,10,7:54.9,35.5", "Humerus:2,7,9:69.1,66.2", "Metacarpal bones:6,0,1:81.3,44.8", "Carpal bones:5,4,2:77.1,48.7", "Tarsus:4,3,1:49.3,6.9", "Metatarsal bones:0,3,5:54.2,2.8", "Pelvis:0,6,9:59,58.3"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Deltoid:4,1,5:65.3,80.2", "Biceps:5,0,4:67.3,71.5", "Pectoral:5,0,4:52.5,76.4", "Trapezius:1,5,4:51.4,85.5", "Abdominal external oblique:1,5,0:54.2,65.9", "Tibialis anterior:1,0,3:59.7,21.8"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Heart:4,2,5:65.3,73", "Aorta:4,2,5:62.9,77.6", "Renal veins:0,4,5:57.3,59.1", "Renal artery:0,5,4:61.5,59.1", "Jugular veins:0,2,5:60.4,86.1", "Femoral vein:0,2,4:67.4,37"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Brain:5,4,3:50.4,96.8", "Cerebellum:5,4,3:56,92.6", "Spinal cord:0,4,3:50.7,86.8", "Sciatic nerve:0,4,5:59.4,37.6", "Tibial nerve:1,5,3:61.1,19.4", "Ganglion:4,3,1:49,70"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        ["Lips:1,2,4:61.4,96.6", "Uvula:6,2,0:48.6,51.8", "Molars:0,6,1:76.1,33", "Incisor:0,4,1:50.4,83", "Tongue:7,2,0:48.2,27.6", "Tonsil:4,0,6:69.5,46.8", "Hard palate:1,2,0:48.6,73.8", "Soft palate:4,2,0:56.3,61"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat6, //
        questionConfig.diff0, //
        ["Frontal lobe:1,2,4:25,58.5", "Temporal lobe:0,2,3:51.2,42.2", "Parietal lobe:0,1,3:66,69", "Occipital lobe:0,1,2:91,46", "Cerebellum:1,2,0:72.8,26.1", "Brainstem:1,2,0:63.3,17.6"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat7, //
        questionConfig.diff0, //
        ["Auricle:1,2,4:8,31", "Ear canal:0,2,6:33.5,42.1", "Eardrum:1,5,6:55.6,42", "Ossicles:1,0,6:54.3,52.9", "Cochlea:6,1,5:75.8,45.7", "Auditory nerve:6,2,1:91.8,48", "Eustachian tube:5,1,3:77.3,28.3"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        ["Aorta:8,6,3:51.7,84.7", "Superior vena cava:6,7,4:27.3,92", "Inferior vena cava:1,4,3:27.8,6.8", "Right atrium:4,7,0:31,54.4", "Left atrium:7,6,0:59.6,55.5", "Mitral valve:8,2,0:69.5,43.7", "Right ventricle:0,1,3:47.8,38.9", "Left ventricle:1,8,3:58.1,43", "Tricuspid valve:1,0,5:41,27"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat9, //
        questionConfig.diff0, //
        ["Iris:6,3,4:11.3,57", "Cornea:2,6,4:1.7,50.5", "Lens:1,4,6:19,51.3", "Retina:1,6,4:64.6,76.8", "Optic nerve:0,6,3:87.9,36.2", "Anterior chamber:6,4,3:7.2,51.4", "Vitreous chamber:1,4,3:49.3,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat10, //
        questionConfig.diff0, //
        ["Nucleus:5,3,2:57.3,75.5", "Nucleolus:2,6,4:44.5,67.9,8", "Cytoplasm:1,4,6:93.08,50.09,9", "Cell membrane:2,5,1:90,24,14", "Ribosome:2,1,3:80.929,75.844,14", "Mitochondrion:1,2,3:51.4,90.35,18", "Endoplasmic reticulum:2,4,1:63.9,25"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat11, //
        questionConfig.diff0, //
        ["Oxygen:1,2,4:74.5,29,25", "Carbon:2,0,4:74.5,57,25", "Hydrogen:1,0,5:74.5,73.2,25", "Nitrogen:1,0,2:74.5,83.5,25", "Calcium:0,1,2:74.5,91.2,25", "Phosphorus:1,2,0:74.5,96.82,25"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["What organ produces bile necessary for digestion?:0,7,6,8", "Through which organ food passes from the pharynx to the stomach?:2,6,9,7", "What organ is the last part of the digestive system?:3,4,7,8", "Where does the most absorption of nutrients and minerals from food take place?:4,5,3,0", "What organ secretes digestive enzymes and gastric acid to aid in food digestion?:5,4,7,3", "What is the part of the throat behind the mouth and nasal cavity named?:6,2,9,8", "Where is bile stored and concentrated before it is released into the small intestine?:7,6,9,8", "Where is insulin secreted from?:8,0,7,6"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["What is a bone structure that forms the head?:0,1,9,7", "What is known also as the shoulder bone?:1,9,11,6", "What is a semi-rigid bony and cartilaginous structure which surrounds the thoracic cavity?:2,7,8,11", "What is the defining characteristic of a vertebrate?:3,0,11,2", "What is the larger of the two bones in the leg below the knee?:4,6,9,5", "What is a long bone in the arm that runs from the shoulder to the elbow?:6,5,1,7", "What is a cluster of seven articulating bones in each foot?:9,7,8,1", "What is the lower part of the torso?:11,6,3,2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["What is the muscle forming the rounded contour of the human shoulder?:0,1,3,5", "What is a large muscle that lies on the front of the upper arm between the shoulder and the elbow?:1,0,2,3", "What muscle is situated at the chest of the human body?:2,3,5,1", "What is a triangular muscle located on the posterior aspect of the neck?:3,1,2,5", "What is the largest of 4 muscles in the anterior compartment of the leg?:5,3,0,1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["What is a muscular organ which pumps blood through the blood vessels of the circulatory system?:0,1,3,5", "What is the main and largest artery in the human body?:1,4,3,2", "What are veins that drain the kidney?:2,5,4,1", "What are paired arteries that supply the kidneys with blood?:3,2,1,5", "What are veins that take deoxygenated blood from the head back to the heart?:4,2,5,1", "What is a large vein located deep within the thigh?:5,2,1,4"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        ["What is an organ that serves as the center of the nervous system?:0,1,2,5", "What is a major feature of the hindbrain of all vertebrates?:1,5,0,2", "What is a long, thin, tubular structure made up of nervous tissue?:2,1,3,4", "What is a large nerve that runs alongside the hip joint?:3,2,1,5", "What is a branch of the sciatic nerve?:4,5,2,1", "What is a group of neuron cell bodies in the peripheral nervous system?:5,1,0,2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        ["What are muscular folds that encircle the mouth?:0,1,4,7", "What is a fleshy extension which hangs above the throat?:1,4,0,7", "What are flat teeth at the back of the mouth?:2,3,5,6", "What are the front teeth?:3,2,5,6", "What is a muscular organ in the mouth?:4,5,6,1", "What organs play an important role in the immune system?:5,1,4,0", "What is a thin horizontal bony plate made up of two bones of the facial skeleton?:6,7,2,5", "What is the soft tissue constituting the back of the roof of the mouth?:7,5,1,0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat6, //
        questionConfig.diff1, //
        ["What is the largest of the four major lobes of the brain?:0,3,1,4", "What sits behind the ears and is the second largest lobe?:1,0,3,2", "What is involved in the perception of sensation, including touch, temperature, pain?:2,0,3,5", "What is the visual processing center of the brain?:3,0,1,4", "What plays an important role in balance control?:4,5,0,1", "What helps to control heart rate and breathing rate?:5,0,4,3"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat7, //
        questionConfig.diff1, //
        ["What is the visible part of the ear that is outside the head?:0,3,6,2", "What is a pathway running from the outer ear to the middle ear?:1,2,3,0", "What is a thin flap of skin that is stretched tight like a drum and vibrates when sound hits it?:2,0,5,3", "What are three bones in the middle ear that are among the smallest bones in the human body?:3,0,6,2", "What resembles to the shell of a snail?:4,2,0,6"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        ["What is the main and largest artery in the human body?:0,3,8,6", "What is the upper chamber through which blood enters the ventricles of the heart?:3,5,6,2", "What valve separates the two chambers of the left side of the heart?:5,8,7,3", "What is muscular chamber that pumps blood out of the heart and into the circulatory system?:6,5,8,7", "It's role is to prevent back flow of blood from the right ventricle into the right atrium.:8,2,5,4"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat9, //
        questionConfig.diff1, //
        ["What is a thin structure in the eye, responsible for controlling the diameter and size of the pupil?:0,1,3,2", "What is the transparent front part of the eye that covers the iris?:1,2,3,0", "What is a transparent structure in the eye that helps to refract light to be focused on the retina?:2,3,0,1", "What is the innermost, light-sensitive layer of tissue of the eye?:3,1,0,2", "What transmits visual information from the retina to the brain?:4,6,5,3"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat10, //
        questionConfig.diff1, //
        ["What is found in the middle of the cell and it contains DNA arranged in chromosomes?:0,1,2,3", "What region within the cell is concerned with producing the cell ribosomes?:1,2,3,4", "What is a gelatinous liquid that fills the inside of a cell?:2,3,4,5", "What protects the cell from its external environment?:3,4,2,1", "What is a cell structure that produces protein?:4,3,2,1", "What converts chemical energy into an energy form that the cell can use?:5,4,3,2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat11, //
        questionConfig.diff1, //
        ["What is used to oxidize our food, in the process of cellular respiration, thus releasing energy?:0,1,2,3", "What is the second most abundant element in the human body?:1,2,3,4", "What is used to keep the human body hydrated?:2,3,4,5", "What is used to make amino acids in our body which in turn make proteins?:3,5,4", "What is used to build and maintain strong bones?:4,0,1,2", "What is used in the formation of bones and teeth?:5,1,2,3"]);
  }

  void addRO(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      AnatomyGameQuestionConfig questionConfig) {
    var language = Language.ro;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Ficat:1,2,3:29.2,45", "Gura:4,2,9:28.1,81.6", "Esofag:1,8,5:48.6,58.6", "Intestinul gros:4,2,6:20.5,21", "Intestinul subțire:8,7,1:52.4,19", "Stomac:4,6,7:66,41", "faringe:5,2,9:48.6,81", "Vezică biliară:6,9,4:31.3,39.6", "Pancreas:2,1,0:50,35.1", "Apendice:2,8,3:35.1,9.6"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Craniu:11,8,6:48,97", "omoplat:5,4,3:61.1,80.2", "Coaste:11,7,0:56,74.1", "Coloană vertebrală:8,10,1:45.9,65.2", "Tibia:5,9,3:51.4,23.6", "Femur:4,10,7:54.9,35.5", "Humerus:2,7,9:69.1,66.2", "Oase metacarpiene:6,0,1:81.3,44.8", "Oasele carpului:5,4,2:77.1,48.7", "Tarsul:4,3,1:49.3,6.9", "Oase metatarsiene:0,3,5:54.2,2.8", "Pelvis:0,6,9:59,58.3"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["deltoid:4,1,5:65.3,80.2", "biceps:5,0,4:67.3,71.5", "pectoral:5,0,4:52.5,76.4", "trapez:1,5,4:51.4,85.5", "Oblicul extern abdominal:1,5,0:54.2,65.9", "Tibialis anterior:1,0,3:59.7,21.8"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Inimă:4,2,5:65.3,73", "aortă:4,2,5:62.9,77.6", "vene renale:0,4,5:57.3,59.1", "Artera renală:0,5,4:61.5,59.1", "vene jugulare:0,2,5:60.4,86.1", "Venă femurală:0,2,4:67.4,37"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Creier:5,4,3:50.4,96.8", "Cerebelul:5,4,3:56,92.6", "Coloană vertebrală:0,4,3:50.7,86.8", "Nervul sciatic:0,4,5:59.4,37.6", "Nervul tibial:1,5,3:61.1,19.4", "ganglion:4,3,1:49,70"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        ["Buze:1,2,4:61.4,96.6", "uvula:6,2,0:48.6,51.8", "Molari:0,6,1:76.1,33", "incisivul:0,4,1:50.4,83", "Limba:7,2,0:48.2,27.6", "amigdale:4,0,6:69.5,46.8", "Palatul dur:1,2,0:48.6,73.8", "Palatul moale:4,2,0:56.3,61"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat6, //
        questionConfig.diff0, //
        ["Lobul frontal:1,2,4:25,58.5", "Lobul temporal:0,2,3:51.2,42.2", "Lobul parietal:0,1,3:66,69", "Lobul occipital:0,1,2:91,46", "Cerebelul:1,2,0:72.8,26.1", "Trunchiul cerebral:1,2,0:63.3,17.6"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat7, //
        questionConfig.diff0, //
        ["Pavilionul urechii:1,2,4:8,31", "Canalul urechii:0,2,6:33.5,42.1", "Timpan:1,5,6:55.6,42", "Oscioarele urechii:1,0,6:54.3,52.9", "cohlee:6,1,5:75.8,45.7", "Nerv auditiv:6,2,1:91.8,48", "Tub Eustahian:5,1,3:77.3,28.3"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        ["aortă:8,6,3:51.7,84.7", "Vena cavă superioară:6,7,4:27.3,92", "vena cavă Inferioră:1,4,3:27.8,6.8", "Atriul drept:4,7,0:31,54.4", "Atriul stâng:7,6,0:59.6,55.5", "Valva mitrala:8,2,0:69.5,43.7", "Ventriculul drept:0,1,3:47.8,38.9", "Ventriculul stâng:1,8,3:58.1,43", "Valva tricuspidă:1,0,5:41,27"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat9, //
        questionConfig.diff0, //
        ["Iris:6,3,4:11.3,57", "cornee:2,6,4:1.7,50.5", "cristalin:1,4,6:19,51.3", "Retină:1,6,4:64.6,76.8", "Nervul optic:0,6,3:87.9,36.2", "Camera anterioară:6,4,3:7.2,51.4", "Umoare vitroasă:1,4,3:49.3,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat10, //
        questionConfig.diff0, //
        ["Nucleu:5,3,2:57.3,75.5", "Nucleol:2,6,4:44.5,67.9,8", "Citoplasmă:1,4,6:93.08,50.09,9", "Membrană celulară:2,5,1:90,24,14", "Ribozom:2,1,3:80.929,75.844,14", "Mitocondrie:1,2,3:51.4,90.35,18", "Reticul endoplasmatic:2,4,1:63.9,25"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat11, //
        questionConfig.diff0, //
        ["Oxigen:1,2,4:74.5,29,25", "Carbon:2,0,4:74.5,57,25", "Hidrogen:1,0,5:74.5,73.2,25", "Azot:1,0,2:74.5,83.5,25", "Calciu:0,1,2:74.5,91.2,25", "Fosfor:1,2,0:74.5,96.82,25"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["Ce organ produce bila necesară digestiei?:0,7,6,8", "Prin ce organ alimentele trec din faringe în stomac?:2,6,9,7", "Ce organ este ultima parte a sistemului digestiv?:3,4,7,8", "Unde are loc cea mai mare absorbție de nutrienți și minerale din alimente?:4,5,3,0", "Ce organ secretă enzimele digestive și acidul gastric pentru a ajuta la digestia alimentelor?:5,4,7,3", "Cum se numește partea gâtului din spatele gurii și cavității nazale?:6,2,9,8", "Unde este stocată și concentrată bila înainte de a fi eliberată în intestinul subțire?:7,6,9,8", "De unde se secretă insulina?:8,0,7,6"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["Ce este o structură osoasă care formează capul?:0,1,9,7", "Ce este cunoscut și sub numele de osul umărului?:1,9,11,6", "Ce este o structură osoasă care înconjoară cavitatea toracică?:2,7,8,11", "Care este caracteristica definitorie a unei vertebrate?:3,0,11,2", "Care este cel mai mare dintre cele două oase de sub genunchi?:4,6,9,5", "Ce este un os lung în braț situat între umăr și cot?:6,5,1,7", "Ce este un grup de șapte oase articulate în fiecare picior?:9,7,8,1", "Care este partea inferioară a trunchiului?:11,6,3,2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["Ce este mușchiul care formează conturul rotunjit al umărului uman?:0,1,3,5", "Ce este un mușchi mare care se află pe partea din față a brațului între umăr și cot?:1,0,2,3", "Ce mușchi se află la nivelul pieptului corpului uman?:2,3,5,1", "Ce este un mușchi triunghiular situat pe partea posterioară a gâtului?:3,1,2,5", "Care este cel mai mare dintre cei 4 mușchi din compartimentul anterior al piciorului?:5,3,0,1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["Ce este un organ muscular care pompează sângele prin vasele de sânge ale sistemului circulator?:0,1,3,5", "Care este artera principală și cea mai mare din corpul uman?:1,4,3,2", "Ce sunt venele care drenează rinichii?:2,5,4,1", "Care sunt arterele pereche care alimentează rinichii cu sânge?:3,2,1,5", "Ce sunt venele care duc sângele dezoxigenat din cap înapoi în inimă?:4,2,5,1", "Ce este o venă mare situată adânc în interiorul coapsei?:5,2,1,4"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        ["Ce este un organ care servește ca centru al sistemului nervos?:0,1,2,5", "Care este o caracteristică majoră a creierului posterior al tuturor vertebratelor?:1,5,0,2", "Ce este o structură tubulară lungă, subțire, formată din țesut nervos?:2,1,3,4", "Ce este un nerv mare care se află lângă articulația șoldului?:3,2,1,5", "Ce este o ramură a nervului sciatic?:4,5,2,1", "Ce este un grup de corpuri de celule neuronice din sistemul nervos periferic?:5,1,0,2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        ["Ce sunt structurile musculare care înconjoară gura?:0,1,4,7", "Ce este o extensie cărnoasă care atârnă deasupra gâtului?:1,4,0,7", "Ce sunt dinții plati în spatele gurii?:2,3,5,6", "Care sunt dinții din față?:3,2,5,6", "Ce este un organ muscular în gură?:4,5,6,1", "Ce organe joacă un rol important în sistemul imunitar?:5,1,4,0", "Ce este o placă osoasă subțire orizontală formată din două oase ale scheletului feței?:6,7,2,5", "Care este țesutul moale care constituie partea din spate a acoperișului gurii?:7,5,1,0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat6, //
        questionConfig.diff1, //
        ["Care este cel mai mare dintre cei patru lobi principali ai creierului?:0,3,1,4", "Ce se află în spatele urechilor și este al doilea lob ca mărime?:1,0,3,2", "Ce este implicat în percepția senzației, inclusiv atingerea, temperatura, durerea?:2,0,3,5", "Care este centrul de procesare vizuală a creierului?:3,0,1,4", "Ce joacă un rol important în controlul echilibrului?:4,5,0,1", "Ce ajută la controlul ritmului cardiac și al respirației?:5,0,4,3"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat7, //
        questionConfig.diff1, //
        ["Care este partea vizibilă a urechii care se află în afara capului?:0,3,6,2", "Ce este o cale care merge de la urechea exterioară la urechea medie?:1,2,3,0", "Ce este o clapă subțire de piele care este întinsă ca un tambur?:2,0,5,3", "Care sunt cele trei oase care se numără printre cele mai mici oase din corpul uman?:3,0,6,2", "Ce transformă sunetul într-un mesaj neuronal?:4,2,0,6"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        ["Care este artera principală și cea mai mare din corpul uman?:0,3,8,6", "Care este camera superioară prin care sângele pătrunde în ventriculii inimii?:3,5,6,2", "Ce supapă separă cele două camere din partea stângă a inimii?:5,8,7,3", "Ce este camera musculară care pompează sângele din inimă în sistemul circulator?:6,5,8,7", "Rolul său este de a preveni fluxul de sânge înapoi din ventriculul drept în atriul drept.:8,2,5,4"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat9, //
        questionConfig.diff1, //
        ["Ce este o structură subțire în ochi, responsabilă pentru controlul diametrului și dimensiunii pupilei?:0,1,3,2", "Care este partea frontală transparentă a ochiului care acoperă irisul?:1,2,3,0", "Ce este o structură transparentă în ochi care ajută la refractarea luminii?:2,3,0,1", "Ce strat al ochiului este cel mai sensibil la lumină?:3,1,0,2", "Ce transmite informații vizuale de la retină la creier?:4,6,5,3"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat10, //
        questionConfig.diff1, //
        ["Ce se găsește în mijlocul celulei și conține ADN aranjat în cromozomi?:0,1,2,3", "Ce regiune din interiorul celulei este preocupată de producerea ribozomilor celulari?:1,2,3,4", "Ce este un lichid gelatinos care umple interiorul unei celule?:2,3,4,5", "Ce protejează celula de mediul său extern?:3,4,2,1", "Ce este o structură celulară care produce proteine?:4,3,2,1", "Ce transformă energia chimică într-o formă de energie pe care celula o poate folosi?:5,4,3,2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat11, //
        questionConfig.diff1, //
        ["Ce se folosește pentru a ne oxida hrana, în procesul de respirație celulară, eliberând astfel energie?:0,1,2,3", "Care este al doilea element cel mai abundent din corpul uman?:1,2,3,4", "Ce se folosește pentru a menține corpul uman hidratat?:2,3,4,5", "Ce se folosește pentru a produce aminoacizi în corpul nostru care la rândul lor produc proteine?:3,5,4", "Ce se folosește pentru a construi și a menține oase puternice?:4,0,1,2", "Ce se utilizează în formarea oaselor și a dinților?:5,1,2,3"]);
  }
}
