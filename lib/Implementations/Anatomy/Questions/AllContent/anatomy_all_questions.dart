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
        ["What organ produces bile necessary for digestion?:0,7,6,8", "What is the first portion of the alimentary canal that receives food and produces saliva?:1,2,6,5", "Through which organ food passes from the pharynx to the stomach?:2,6,9,7", "What organ is the last part of the digestive system?:3,4,7,8", "Where does the most absorption of nutrients and minerals from food take place?:4,5,3,0", "What organ secretes digestive enzymes and gastric acid to aid in food digestion?:5,4,7,3", "What is the part of the throat behind the mouth and nasal cavity named?:6,2,9,8", "Where is bile stored and concentrated before it is released into the small intestine?:7,6,9,8", "Where is insulin secreted from?:8,0,7,6", "What organ is located in the lower right abdomen?:9,0,7,2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["What is a bone structure that forms the head?:0,1,9,7", "What is known also as the shoulder bone?:1,9,11,6", "What is a semi-rigid bony and cartilaginous structure which surrounds the thoracic cavity?:2,7,8,11", "What is the defining characteristic of a vertebrate?:3,0,11,2", "What is the larger of the two bones in the leg below the knee?:4,6,9,5", "What is the longest and strongest bone in your body?:5,6,9,1", "What is a long bone in the arm that runs from the shoulder to the elbow?:6,5,1,7", "What is a group of five bones of the hand between the phalanges and the wrist?:7,5,1,3", "What bones make up the wrist?:8,7,9,10", "What is a cluster of seven articulating bones in each foot?:9,7,8,1", "What is a group of five long bones in the foot?:10,8,7,4", "What is the lower part of the torso?:11,6,3,2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["What is the muscle forming the rounded contour of the human shoulder?:0,1,3,5", "What is a large muscle that lies on the front of the upper arm between the shoulder and the elbow?:1,0,2,3", "What muscle is situated at the chest of the human body?:2,3,5,1", "What is a triangular muscle located on the posterior aspect of the neck?:3,1,2,5", "What muscle is the largest of the lateral abdominal muscles?:4,1,2,0", "What is the largest of 4 muscles in the anterior compartment of the leg?:5,3,0,1"]);
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
        ["What is the visible part of the ear that is outside the head?:0,3,6,2", "What is a pathway running from the outer ear to the middle ear?:1,2,3,0", "What is a thin flap of skin that is stretched tight like a drum and vibrates when sound hits it?:2,0,5,3", "What are three bones in the middle ear that are among the smallest bones in the human body?:3,0,6,2", "What resembles to the shell of a snail?:4,2,0,6", "What carries auditory sensory information from the cochlea of the inner ear directly to the brain?:5,2,0,6", "What is also known as the auditory tube?:6,1,4,0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        ["What is the main and largest artery in the human body?:0,3,8,6", "Which vein carries blood from your head, neck, arms and chest back to your heart?:1,3,0,2", "Which vein carries blood from your lower body back to your heart?:2,1,0,3", "What is the upper chamber through which blood enters the ventricles of the heart?:3,5,6,2", "what heart chamber receives oxygenated blood from the lungs?:4,3,6,8", "What valve separates the two chambers of the left side of the heart?:5,8,7,3", "What is muscular chamber that pumps blood out of the heart and into the circulatory system?:6,5,8,2", "Which is one of four chambers of the heart?:7,0,1,2", "It's role is to prevent back flow of blood from the right ventricle into the right atrium.:8,2,5,4"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat9, //
        questionConfig.diff1, //
        ["What is a thin structure in the eye, responsible for controlling the diameter and size of the pupil?:0,1,3,2", "What is the transparent front part of the eye that covers the iris?:1,2,3,0", "What is a transparent structure in the eye that helps to refract light to be focused on the retina?:2,3,0,1", "What is the innermost, light-sensitive layer of tissue of the eye?:3,1,0,2", "What transmits visual information from the retina to the brain?:4,6,5,3", "What is the front part of the eye between the cornea and the iris?:5,6,2,3", "What eye chamber is located behind the lens and in front of the optic nerve?:6,5,3,0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat10, //
        questionConfig.diff1, //
        ["What is found in the middle of the cell and it contains DNA arranged in chromosomes?:0,1,2,3", "What region within the cell is concerned with producing the cell ribosomes?:1,2,3,4", "What is a gelatinous liquid that fills the inside of a cell?:2,3,4,5", "What protects the cell from its external environment?:3,4,2,1", "What is a cell structure that produces protein?:4,3,2,1", "What converts chemical energy into an energy form that the cell can use?:5,4,3,2", "What is the transportation system of the eukaryotic cell?:6,5,0,1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat11, //
        questionConfig.diff1, //
        ["What is used to oxidize our food, in the process of cellular respiration, thus releasing energy?:0,1,2,3", "What is the second most abundant element in the human body?:1,2,3,4", "What is used to keep the human body hydrated?:2,3,4,5", "What is used to make amino acids in our body which in turn make proteins?:3,5,4", "What is used to build and maintain strong bones?:4,0,1,2", "What is used in the formation of bones and teeth?:5,1,2,3"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["What is a disease in which your liver becomes inflamed?:Hepatitis::", "What is a disease in which a parasite infects the gastro-intestinal tract of humans?:Intestinal parasites::", "What is a disease in which your pancreas becomes inflamed?:Pancreatitis::", "What is a disease that causes a break in the inner lining of the stomach?:Gastric ulcer::", "What is a disease in which your appendix becomes inflamed?:Appendicitis::", "What is a disease in which your inner lining of the stomach becomes inflamed?:Gastritis::", "What disease causes swollen veins in your lower rectum?:Hemorrhoids::", "What are hard deposits made of minerals and salts?:Kidney stones::", "What is scarring of the liver caused by long-term liver damage?:Cirrhosis::", "What is a type of inflammatory bowel disease?:Crohn's disease::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["What disease causes pain and inflammation in a joint?:Arthritis::", "What is a break in the continuity of a bone?:Bone fracture::", "What disease weakens bones, making them fragile and more likely to break?:Osteoporosis::", "What disease causes a sideways curvature of the spine?:Scoliosis::", "What is a type of arthritis that causes sudden, severe joint pain?:Gout::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["What disease causes progressive weakness and loss of muscle mass?:muscular dystrophy::", "What disease is caused by lack of physical activity?:muscular atrophy::", "What disease causes the inflammation or irritation of a tendon?:tendinitis::", "What is a sudden and involuntary contraction of one of your muscles?:muscular cramps::", "What occurs when your muscle is overstretched or torn?:muscle rupture::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["What is a type of cancer that starts in cells that are part of the body's immune system?:Lymphoma::", "What is a type of cancer that usually begins in the bone marrow?:Leukemia::", "What is caused by prolonged exposures to very cold temperatures?:Hypothermia::", "What is a hardening of your arteries caused by gradual plaque buildup?:Atherosclerosis::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        ["What is an acute inflammation of the protective membranes covering the brain and spinal cord?:Meningitis::", "What is a disease that can affect your brain and spinal cord, and can cause problems with vision, balance, muscle control?:Multiple sclerosis::", "What is a brain disorder that leads to shaking, stiffness, and difficulty with walking, balance, and coordination?:Parkinson's disease::", "What is characterized by multiple movement tics and at least one vocal tic?:Tourette syndrome::", "What is an incurable, hereditary brain disorder that damages brain cells?:Huntington's disease::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        ["What is a serious gum infection that damages the soft tissue and that can destroy the bone that supports your teeth?:Periodontitis::", "What is a mild form of gum disease that causes irritation, redness and swelling of your gingiva?:gingivitis::", "What are permanently damaged areas in the hard surface of your teeth?:Tooth decay::", "What is an infection of the tonsils at the back of your throat?:Tonsillitis::", "What happens if the tissue that makes up the lip does not join completely before birth?:Cleft lip::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat6, //
        questionConfig.diff2, //
        ["What brain disorder destroys memory and thinking skills and, eventually, the ability to carry out the simplest tasks?:Alzheimer's disease::", "What is an uncommon but serious condition in which the brain becomes inflamed?:Encephalitis::", "What is a headache disorder characterized by recurrent headaches that are moderate to severe?:Migraine::", "What is a disease that affects the brain and causes frequent seizures?:Epilepsy::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat7, //
        questionConfig.diff2, //
        ["What occurs when a virus or bacteria cause the area behind the eardrum to become inflamed?:Otitis‎::", "What refers to the total or partial inability to hear sounds?:Deafness::", "What is a condition in which you hear sounds when there is no outside source of the sounds?:Tinnitus::", "What is a disorder of the inner ear that can lead to dizzy spells (vertigo) and hearing loss?:Meniere's disease::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        ["What is a chest pain caused by reduced blood flow to the heart muscles?:Angina::", "What is blood pressure that is higher than normal?:Hypertension::", "What occurs when blood flow decreases or stops to the coronary artery of the heart?:Myocardial infarction::", "What is a serious condition in which the heart doesn't pump blood as efficiently as it should?:Congestive heart failure::", "What is a word for high levels of cholesterol in the blood?:Hypercholesterolemia::", "What is an abnormality of the heart's rhythm?:Arrhythmia::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat9, //
        questionConfig.diff2, //
        ["What is a cloudy area in the lens of the eye that leads to a decrease in vision?:Cataract::", "What is an eye condition caused by infection or allergies?:Conjunctivitis::", "What is an eye condition where the optic nerve, which connects the eye to the brain, becomes damaged?:Glaucoma::", "What is a disorder of sight in which the brain fails to fully process inputs from one eye and over time favors the other eye?:Amblyopia::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat10, //
        questionConfig.diff2, //
        ["What is a type of cancer that may include a lump in the breast or a change in breast shape?:Breast cancer::", "What is the most common type of cancer that affects only men?:Prostate cancer::", "What is a type of cancer in which cells in the colon or rectum grow out of control?:Colorectal cancer::", "What type of cancer is caused by long-term tobacco smoking?:Lung cancer::", "What type of cancer is caused by overexposure to ultraviolet rays from the sun?:Skin cancer::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat11, //
        questionConfig.diff2, //
        ["What is a below-normal level of oxygen in your blood called, specifically in the arteries?:Hypoxemia::", "What is a below-normal level of calcium in your blood called?:Hypocalcemia::", "What is an above-normal level of calcium in your blood called?:Hypercalcemia::", "What is a below-normal level of phosphate in your blood called?:hypophosphatemia::", "What is an above-normal level of phosphate in your blood called?:Hyperphosphatemia::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["Yellowing of the skin and the whites of your eyes:3,4,5:Hepatitis:3,4,5:", "Rash or itching around the rectum:2,7,8:Intestinal parasites:2,7,8:", "Moderate to severe abdominal pain that may spread to your back:1,3,4:Pancreatitis:1,3,4:", "Severe stomach pain:6,7,8:Gastric ulcer:6,7,8:", "Sudden pain that begins on the right side of the lower abdomen:0,3,7:Appendicitis:0,3,7:", "Nausea or recurrent upset stomach:4,2,1:Gastritis:4,2,1:", "Extreme itching around the anus:0,2,3:Hemorrhoids:0,2,3:", "Pain or burning sensation while urinating:3,9,1:Kidney stones:3,9,1:", "Yellowing of the skin and the whites of your eyes:7,5,4:Cirrhosis:7,5,4:", "Blood in the stool:2,7,8:Crohn's disease:2,7,8:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff3, //
        ["joint pain:1,2,3:Arthritis:1,2,3:", "immediate, severe pain:2,3:Bone fracture:2,3:", "Loss of height over time:1,3,4:Osteoporosis:1,3,4:", "a visibly curved spine:0,1,2:Scoliosis:0,1,2:", "red, shiny skin over the affected joint:1,2,3:Gout:1,2,3:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Large calf muscles:2,3,4:muscular dystrophy:2,3,4:", "One arm or one leg is smaller than the other:2,3,4:muscular atrophy:2,3,4:", "pain in a tendon that gets worse when you move:1,3,4:tendinitis:1,3,4:", "A sudden, sharp pain:1,2:muscular cramps:1,2:", "sudden pain that worsens while contracting the muscle:1,2:muscle rupture:1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["Painless swelling of lymph nodes in your neck, armpits or groin:2,3:Lymphoma:2,3:", "Swollen lymph nodes, enlarged liver or spleen:2,3:Leukemia:2,3:", "Shivering:0,1:Hypothermia:0,1:", "Numbness or weakness in your arms or legs:0,1,2:Atherosclerosis:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff3, //
        ["Sudden high fever, severe headache that seems different from normal:1,2,3:Meningitis:1,2,3:", "blindness in one eye:0,3,4:Multiple sclerosis:0,3,4:", "Tremor in hands:0,3,4:Parkinson's disease:0,3,4:", "movement tics:0,1,4:Tourette syndrome:0,1,4:", "difficulty concentrating and memory lapses:0,1,2:Huntington's disease:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        ["Red or swollen gums:2,3,4:Periodontitis:2,3,4:", "Red or swollen gums:2,3,4:gingivitis:2,3,4:", "Toothache:0,4,3:Tooth decay:0,4,3:", "problems swallowing:0,2,4:Tonsillitis:0,2,4:", "Deformities of the upper jaw:0,2,3:Cleft lip:0,2,3:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat6, //
        questionConfig.diff3, //
        []);
    addQuestions(
        result, //
        language, //
        questionConfig.cat7, //
        questionConfig.diff3, //
        ["fluid that drains from the ear:1,2,3:Otitis‎:1,2,3:", "Loss of hearing:0,2,3:Deafness:0,2,3:", "a ringing noise in the ears:0,1,3:Tinnitus:0,1,3:", "vertigo:0,1,2:Meniere's disease:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        []);
    addQuestions(
        result, //
        language, //
        questionConfig.cat9, //
        questionConfig.diff3, //
        ["Clouded vision:1,2,3:Cataract:1,2,3:", "Pink or red color in the white of the eye:0,2,3:Conjunctivitis:0,2,3:", "intense eye pain:0,1,3:Glaucoma:0,1,3:", "Poor depth perception and peripheral vision:0,1,2:Amblyopia:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat10, //
        questionConfig.diff3, //
        ["A new lump in the breast or underarm:1,2,3:Breast cancer:1,2,3:", "Blood in the urine:2,3,4:Prostate cancer:2,3,4:", "A change in bowel habits:1,3,4:Colorectal cancer:1,3,4:", "a cough that doesn't go away after 2 or 3 weeks:1,2,4:Lung cancer:1,2,4:", "A mole that changes in color, size or that bleeds:0,1,3:Skin cancer:0,1,3:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat11, //
        questionConfig.diff3, //
        ["Bluish color in skin, fingernails, and lips:1,2,3:Hypoxemia:1,2,3:", "Twitching in your hands, face, and feet:0,2,4:Hypocalcemia:0,2,4:", "More frequent urination and thirst:0,1:Hypercalcemia:0,1:", "weakening of bones:0,4:hypophosphatemia:0,4:", "muscle cramps or spasms:0,1:Hyperphosphatemia:0,1:"]);
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
        ["What organ produces bile necessary for digestion?:0,7,6,8", "What is the first portion of the alimentary canal that receives food and produces saliva?:1,2,6,5", "Through which organ food passes from the pharynx to the stomach?:2,6,9,7", "What organ is the last part of the digestive system?:3,4,7,8", "Where does the most absorption of nutrients and minerals from food take place?:4,5,3,0", "What organ secretes digestive enzymes and gastric acid to aid in food digestion?:5,4,7,3", "What is the part of the throat behind the mouth and nasal cavity named?:6,2,9,8", "Where is bile stored and concentrated before it is released into the small intestine?:7,6,9,8", "Where is insulin secreted from?:8,0,7,6", "What organ is located in the lower right abdomen?:9,0,7,2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["What is a bone structure that forms the head?:0,1,9,7", "What is known also as the shoulder bone?:1,9,11,6", "What is a semi-rigid bony and cartilaginous structure which surrounds the thoracic cavity?:2,7,8,11", "What is the defining characteristic of a vertebrate?:3,0,11,2", "What is the larger of the two bones in the leg below the knee?:4,6,9,5", "What is the longest and strongest bone in your body?:5,6,9,1", "What is a long bone in the arm that runs from the shoulder to the elbow?:6,5,1,7", "What is a group of five bones of the hand between the phalanges and the wrist?:7,5,1,3", "What bones make up the wrist?:8,7,9,10", "What is a cluster of seven articulating bones in each foot?:9,7,8,1", "What is a group of five long bones in the foot?:10,8,7,4", "What is the lower part of the torso?:11,6,3,2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["What is the muscle forming the rounded contour of the human shoulder?:0,1,3,5", "What is a large muscle that lies on the front of the upper arm between the shoulder and the elbow?:1,0,2,3", "What muscle is situated at the chest of the human body?:2,3,5,1", "What is a triangular muscle located on the posterior aspect of the neck?:3,1,2,5", "What muscle is the largest of the lateral abdominal muscles?:4,1,2,0", "What is the largest of 4 muscles in the anterior compartment of the leg?:5,3,0,1"]);
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
        ["What is the visible part of the ear that is outside the head?:0,3,6,2", "What is a pathway running from the outer ear to the middle ear?:1,2,3,0", "What is a thin flap of skin that is stretched tight like a drum and vibrates when sound hits it?:2,0,5,3", "What are three bones in the middle ear that are among the smallest bones in the human body?:3,0,6,2", "What resembles to the shell of a snail?:4,2,0,6", "What carries auditory sensory information from the cochlea of the inner ear directly to the brain?:5,2,0,6", "What is also known as the auditory tube?:6,1,4,0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        ["What is the main and largest artery in the human body?:0,3,8,6", "Which vein carries blood from your head, neck, arms and chest back to your heart?:1,3,0,2", "Which vein carries blood from your lower body back to your heart?:2,1,0,3", "What is the upper chamber through which blood enters the ventricles of the heart?:3,5,6,2", "what heart chamber receives oxygenated blood from the lungs?:4,3,6,8", "What valve separates the two chambers of the left side of the heart?:5,8,7,3", "What is muscular chamber that pumps blood out of the heart and into the circulatory system?:6,5,8,2", "Which is one of four chambers of the heart?:7,0,1,2", "It's role is to prevent back flow of blood from the right ventricle into the right atrium.:8,2,5,4"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat9, //
        questionConfig.diff1, //
        ["What is a thin structure in the eye, responsible for controlling the diameter and size of the pupil?:0,1,3,2", "What is the transparent front part of the eye that covers the iris?:1,2,3,0", "What is a transparent structure in the eye that helps to refract light to be focused on the retina?:2,3,0,1", "What is the innermost, light-sensitive layer of tissue of the eye?:3,1,0,2", "What transmits visual information from the retina to the brain?:4,6,5,3", "What is the front part of the eye between the cornea and the iris?:5,6,2,3", "What eye chamber is located behind the lens and in front of the optic nerve?:6,5,3,0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat10, //
        questionConfig.diff1, //
        ["What is found in the middle of the cell and it contains DNA arranged in chromosomes?:0,1,2,3", "What region within the cell is concerned with producing the cell ribosomes?:1,2,3,4", "What is a gelatinous liquid that fills the inside of a cell?:2,3,4,5", "What protects the cell from its external environment?:3,4,2,1", "What is a cell structure that produces protein?:4,3,2,1", "What converts chemical energy into an energy form that the cell can use?:5,4,3,2", "What is the transportation system of the eukaryotic cell?:6,5,0,1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat11, //
        questionConfig.diff1, //
        ["What is used to oxidize our food, in the process of cellular respiration, thus releasing energy?:0,1,2,3", "What is the second most abundant element in the human body?:1,2,3,4", "What is used to keep the human body hydrated?:2,3,4,5", "What is used to make amino acids in our body which in turn make proteins?:3,5,4", "What is used to build and maintain strong bones?:4,0,1,2", "What is used in the formation of bones and teeth?:5,1,2,3"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["What is a disease in which your liver becomes inflamed?:hepatită::", "What is a disease in which a parasite infects the gastro-intestinal tract of humans?:Paraziți intestinali::", "What is a disease in which your pancreas becomes inflamed?:Pancreatită::", "What is a disease that causes a break in the inner lining of the stomach?:Ulcer gastric::", "What is a disease in which your appendix becomes inflamed?:Apendicită::", "What is a disease in which your inner lining of the stomach becomes inflamed?:Gastrită::", "What disease causes swollen veins in your lower rectum?:Hemoroizi::", "What are hard deposits made of minerals and salts?:Pietre la rinichi::", "What is scarring of the liver caused by long-term liver damage?:Ciroză::", "What is a type of inflammatory bowel disease?:Boala Crohn::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["What disease causes pain and inflammation in a joint?:Artrită::", "What is a break in the continuity of a bone?:Fractură osoasă::", "What disease weakens bones, making them fragile and more likely to break?:Osteoporoza::", "What disease causes a sideways curvature of the spine?:scolioza::", "What is a type of arthritis that causes sudden, severe joint pain?:Gută::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["What disease causes progressive weakness and loss of muscle mass?:distrofie musculara::", "What disease is caused by lack of physical activity?:atrofie musculară::", "What disease causes the inflammation or irritation of a tendon?:tendinita::", "What is a sudden and involuntary contraction of one of your muscles?:crampe musculare::", "What occurs when your muscle is overstretched or torn?:ruptură musculară::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["What is a type of cancer that starts in cells that are part of the body's immune system?:Limfom::", "What is a type of cancer that usually begins in the bone marrow?:leucemie::", "What is caused by prolonged exposures to very cold temperatures?:Hipotermie::", "What is a hardening of your arteries caused by gradual plaque buildup?:Ateroscleroza::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        ["What is an acute inflammation of the protective membranes covering the brain and spinal cord?:Meningita::", "What is a disease that can affect your brain and spinal cord, and can cause problems with vision, balance, muscle control?:Scleroză multiplă::", "What is a brain disorder that leads to shaking, stiffness, and difficulty with walking, balance, and coordination?:boala Parkinson::", "What is characterized by multiple movement tics and at least one vocal tic?:sindromul Tourette::", "What is an incurable, hereditary brain disorder that damages brain cells?:boala Huntington::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        ["What is a serious gum infection that damages the soft tissue and that can destroy the bone that supports your teeth?:Parodontita::", "What is a mild form of gum disease that causes irritation, redness and swelling of your gingiva?:gingivita::", "What are permanently damaged areas in the hard surface of your teeth?:Carie dentară::", "What is an infection of the tonsils at the back of your throat?:Amigdalită::", "What happens if the tissue that makes up the lip does not join completely before birth?:Buza despicată::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat6, //
        questionConfig.diff2, //
        ["What brain disorder destroys memory and thinking skills and, eventually, the ability to carry out the simplest tasks?:Boala Alzheimer::", "What is an uncommon but serious condition in which the brain becomes inflamed?:Encefalită::", "What is a headache disorder characterized by recurrent headaches that are moderate to severe?:Migrenă::", "What is a disease that affects the brain and causes frequent seizures?:Epilepsie::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat7, //
        questionConfig.diff2, //
        ["What occurs when a virus or bacteria cause the area behind the eardrum to become inflamed?:Otita::", "What refers to the total or partial inability to hear sounds?:Surditate::", "What is a condition in which you hear sounds when there is no outside source of the sounds?:Tinitus::", "What is a disorder of the inner ear that can lead to dizzy spells (vertigo) and hearing loss?:boala Meniere::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        ["What is a chest pain caused by reduced blood flow to the heart muscles?:angina pectorală::", "What is blood pressure that is higher than normal?:Hipertensiune::", "What occurs when blood flow decreases or stops to the coronary artery of the heart?:Infarct miocardic::", "What is a serious condition in which the heart doesn't pump blood as efficiently as it should?:Insuficiență cardiacă congestivă::", "What is a word for high levels of cholesterol in the blood?:Hipercolesterolemie::", "What is an abnormality of the heart's rhythm?:Aritmie::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat9, //
        questionConfig.diff2, //
        ["What is a cloudy area in the lens of the eye that leads to a decrease in vision?:Cataractă::", "What is an eye condition caused by infection or allergies?:Conjunctivită::", "What is an eye condition where the optic nerve, which connects the eye to the brain, becomes damaged?:Glaucom::", "What is a disorder of sight in which the brain fails to fully process inputs from one eye and over time favors the other eye?:Ambliopia::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat10, //
        questionConfig.diff2, //
        ["What is a type of cancer that may include a lump in the breast or a change in breast shape?:Cancer mamar::", "What is the most common type of cancer that affects only men?:Cancer de prostată::", "What is a type of cancer in which cells in the colon or rectum grow out of control?:Cancer colorectal::", "What type of cancer is caused by long-term tobacco smoking?:Cancer de plamani::", "What type of cancer is caused by overexposure to ultraviolet rays from the sun?:Cancer de piele::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat11, //
        questionConfig.diff2, //
        ["What is a below-normal level of oxygen in your blood called, specifically in the arteries?:Hipoxemie::", "What is a below-normal level of calcium in your blood called?:Hipocalcemie::", "What is an above-normal level of calcium in your blood called?:Hipercalcemie::", "What is a below-normal level of phosphate in your blood called?:hipofosfatemie::", "What is an above-normal level of phosphate in your blood called?:Hiperfosfatemia::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["Yellowing of the skin and the whites of your eyes:hepatită:3,4,5:", "Rash or itching around the rectum:Paraziți intestinali:2,7,8:", "Moderate to severe abdominal pain that may spread to your back:Pancreatită:1,3,4:", "Severe stomach pain:Ulcer gastric:6,7,8:", "Sudden pain that begins on the right side of the lower abdomen:Apendicită:0,3,7:", "Nausea or recurrent upset stomach:Gastrită:4,2,1:", "Extreme itching around the anus:Hemoroizi:0,2,3:", "Pain or burning sensation while urinating:Pietre la rinichi:3,9,1:", "Yellowing of the skin and the whites of your eyes:Ciroză:7,5,4:", "Blood in the stool:Boala Crohn:2,7,8:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff3, //
        ["joint pain:Artrită:1,2,3:", "immediate, severe pain:Fractură osoasă:2,3:", "Loss of height over time:Osteoporoza:1,3,4:", "a visibly curved spine:scolioza:0,1,2:", "red, shiny skin over the affected joint:Gută:1,2,3:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Large calf muscles:distrofie musculara:2,3,4:", "One arm or one leg is smaller than the other:atrofie musculară:2,3,4:", "pain in a tendon that gets worse when you move:tendinita:1,3,4:", "A sudden, sharp pain:crampe musculare:1,2:", "sudden pain that worsens while contracting the muscle:ruptură musculară:1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["Painless swelling of lymph nodes in your neck, armpits or groin:Limfom:2,3:", "Swollen lymph nodes, enlarged liver or spleen:leucemie:2,3:", "Shivering:Hipotermie:0,1:", "Numbness or weakness in your arms or legs:Ateroscleroza:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff3, //
        ["Sudden high fever, severe headache that seems different from normal:Meningita:1,2,3:", "blindness in one eye:Scleroză multiplă:0,3,4:", "Tremor in hands:boala Parkinson:0,3,4:", "movement tics:sindromul Tourette:0,1,4:", "difficulty concentrating and memory lapses:boala Huntington:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        ["Red or swollen gums:Parodontita:2,3,4:", "Red or swollen gums:gingivita:2,3,4:", "Toothache:Carie dentară:0,4,3:", "problems swallowing:Amigdalită:0,2,4:", "Deformities of the upper jaw:Buza despicată:0,2,3:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat6, //
        questionConfig.diff3, //
        []);
    addQuestions(
        result, //
        language, //
        questionConfig.cat7, //
        questionConfig.diff3, //
        ["fluid that drains from the ear:Otita:1,2,3:", "Loss of hearing:Surditate:0,2,3:", "a ringing noise in the ears:Tinitus:0,1,3:", "vertigo:boala Meniere:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        []);
    addQuestions(
        result, //
        language, //
        questionConfig.cat9, //
        questionConfig.diff3, //
        ["Clouded vision:Cataractă:1,2,3:", "Pink or red color in the white of the eye:Conjunctivită:0,2,3:", "intense eye pain:Glaucom:0,1,3:", "Poor depth perception and peripheral vision:Ambliopia:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat10, //
        questionConfig.diff3, //
        ["A new lump in the breast or underarm:Cancer mamar:1,2,3:", "Blood in the urine:Cancer de prostată:2,3,4:", "A change in bowel habits:Cancer colorectal:1,3,4:", "a cough that doesn't go away after 2 or 3 weeks:Cancer de plamani:1,2,4:", "A mole that changes in color, size or that bleeds:Cancer de piele:0,1,3:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat11, //
        questionConfig.diff3, //
        ["Bluish color in skin, fingernails, and lips:Hipoxemie:1,2,3:", "Twitching in your hands, face, and feet:Hipocalcemie:0,2,4:", "More frequent urination and thirst:Hipercalcemie:0,1:", "weakening of bones:hipofosfatemie:0,4:", "muscle cramps or spasms:Hiperfosfatemia:0,1:"]);
  }

}
