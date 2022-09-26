import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Question/Model/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/all_questions_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Constants/hangman_game_question_config.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';

class HangmanAllQuestions extends AllQuestionsService {
  static final HangmanAllQuestions singleton = HangmanAllQuestions.internal();

  factory HangmanAllQuestions() {
    return singleton;
  }

  HangmanAllQuestions.internal();

  @override
  Map<Language, Map<CategoryDifficulty, List<Question>>>
      getAllQuestionsWithLanguages() {
    var questionConfig = HangmanGameQuestionConfig();
    Map<Language, Map<CategoryDifficulty, List<Question>>> result =
        HashMap<Language, Map<CategoryDifficulty, List<Question>>>();
    addEN(result, questionConfig);
    return result;
  }

  void addEN(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HangmanGameQuestionConfig questionConfig) {
    var language = Language.en;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Austria", "Belgium", "Brazil", "Canada", "China", "France", "Germany", "Italy", "Mexico", "Russia", "Spain", "United States of America", "Japan", "Netherlands", "Australia", "Portugal", "Turkey", "Bulgaria", "India", "Greece"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Mouse", "Monkey", "Leopard", "Dolphin", "Cheetah", "Chimpanzee", "Crocodile", "Crow", "Deer", "Rabbit", "Shark", "Tiger", "Pigeon", "Duck", "Eagle", "Elephant", "Giraffe", "Lion", "Bear", "Horse"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Potato", "Orchid", "Beans", "Apple", "Rose", "Corn", "Sunflower", "Garlic", "Raspberries", "Lemon", "Peach", "Oranges", "Pear", "Plum", "Banana", "Cucumber", "Grape", "Tomato", "Carrot"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["apron", "bottle", "bottle opener", "bowl", "cookbook", "cutlery", "fork"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Donut", "Pasta", "Kebab", "Croissant", "Lasagna", "Cheese", "Pizza", "Spaghetti", "Omelette", "Ice cream", "Bread", "Cake", "Roast", "Yogurt", "Fast food", "Pickles", "Maple syrup", "Toast", "Chocolate", "Mashed potatoes"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        ["topple", "wilderness", "avenue", "television", "message", "absent", "bring", "brainstorm", "satisfied", "network", "battery", "threat", "experience", "uniform", "engagement", "minority", "wisecrack", "deter", "looting", "factory", "inhabitant", "cucumber", "bloodshed", "security", "producer", "explicit", "accent", "affect", "graphic", "gas pedal", "guarantee", "suburb", "comfortable", "color-blind", "expenditure", "resolution", "petty", "sticky", "articulate", "manager", "guideline", "leftovers", "projection", "count", "student", "despair", "rally", "spoil", "official", "issue", "appear", "undress", "manual", "thrust", "pocket", "prosecution", "tropical", "social", "deliver", "transform", "kinship", "morning", "chief", "conclusion", "predator", "haunt", "abstract", "architect", "finger", "favourite", "miner", "museum", "apology", "sensitivity", "rhythm", "minimize", "disappear", "penalty", "welfare", "related", "album", "seller", "dream", "separate", "stereotype", "loose", "quantity", "announcement", "color", "visit", "innovation", "enlarge", "impound", "feeling", "countryside", "pattern", "nervous", "volcano", "solid", "brother", "information", "application", "pavement", "profit", "approach", "delicate", "orientation", "village", "version", "formation", "agriculture", "definite", "answer", "champion", "excuse", "retirement", "formulate", "stream", "agenda", "confrontation", "press", "overcharge", "reliance", "prospect", "height", "penetrate", "meaning", "bottle", "appreciate", "disagree", "fight", "return", "buffet", "collect", "clarify", "wrong", "border", "reaction", "knowledge", "rabbit", "alcohol", "safari", "treasurer", "gutter", "democratic", "concede", "beneficiary", "raise", "jacket", "admire", "gregarious", "aspect", "analysis", "elaborate", "transmission", "skeleton", "tease", "member", "unfortunate", "folk music", "withdrawal", "auditor", "suffer", "weave", "citizen", "spite", "ritual", "suite", "pyramid", "relation", "extension", "shake", "porter", "farewell", "salvation", "total", "notorious", "movie", "superintendent", "neutral", "launch", "missile", "disco", "leash", "pound", "house", "apathy", "slime", "money", "incredible", "momentum", "powder", "alive", "hover", "secular", "braid", "exhibition", "equation", "drawer", "reflect", "paralyzed", "formula", "salmon", "impact", "class", "wedding", "revenge", "sulphur", "necklace", "ambition", "negative", "crack", "cultivate", "prayer", "silence", "achievement", "scandal", "relative", "ankle", "insert", "relevance", "castle", "response", "helmet", "tender", "shark", "stage", "metal", "battle", "neglect", "front", "justice", "expand", "privacy", "consider", "advertising", "transaction", "discover", "district", "tight", "creation", "Bible", "nursery", "shatter", "develop", "common", "resource", "insist", "jurisdiction", "tablet", "husband", "combination", "entry", "ethics", "person", "index", "laboratory", "linen", "cause", "contrast", "catalogue", "anger", "guilt", "tycoon", "potential", "explain", "complete", "recycle", "belly", "traffic", "obese", "produce", "slippery", "extreme", "reality", "shoulder", "judge", "acquaintance", "wheel", "uncle", "railcar", "small", "pierce", "broccoli", "foundation"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["Cyprus", "Colombia", "Czech Republic", "Croatia", "Denmark", "Egypt", "Switzerland", "Finland", "Ghana", "Morocco", "Iran", "Nigeria", "Serbia", "Norway", "Belarus", "Sweden", "South Korea", "Ukraine", "Hungary", "Algeria"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["Alligator", "Antelope", "Donkey", "Rhino", "Zebra", "Polar Bear", "Goat", "Whale", "Gorilla", "Koala", "Camel", "Hyena", "Frog", "Goldfish", "Jaguar", "Panda", "Sheep", "Wolf", "Tortoise", "Penguin"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["Tulip", "Onion", "Cherries", "Pumpkin", "Strawberry", "Coffee", "Dandelion", "Pineapple", "Peanuts", "Nettle", "Apricot", "Coconut", "Grapefruit", "Watermelon", "Melon", "Sour cherries", "Mint", "Peppers", "Cabbage", "Peas"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["cook", "dishwasher", "food", "garbage can", "juicer", "oven", "recipe"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        ["Peanut Butter", "Chips", "Tacos", "Pudding", "Meatballs", "Roast chicken", "Honey", "Seafood", "French fries", "Sausages", "Hamburger", "Mayonnaise", "Popcorn", "Cheeseburger", "Hot Dog", "Cupcake", "Bacon", "Ketchup", "Butter", "Pancake"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        ["prosper", "coast", "attitude", "shell", "tiger", "machinery", "company", "slave", "score", "guerrilla", "limit", "chimpanzee", "detector", "allowance", "correspondence", "crash", "refund", "valid", "coffin", "dignity", "reveal", "production", "range", "ridge", "nonremittal", "motivation", "designer", "sketch", "sculpture", "catch", "substitute", "royalty", "aisle", "greet", "snack", "comedy", "study", "correction", "winter", "distortion", "arrow", "abuse", "courage", "tragedy", "misplace", "basis", "think", "paradox", "theme", "snarl", "bomber", "responsibility", "experiment", "supplementary", "subway", "agile", "unlawful", "conception", "power", "criticism", "twist", "grimace", "dozen", "continuous", "fashionable", "disappointment", "first", "registration", "global", "sniff", "embark", "extent", "provoke", "liability", "inflate", "result", "obstacle", "decoration", "glass", "marriage", "pursuit", "swear", "brink", "abortion", "runner", "reactor", "disgrace", "conference", "labour", "illusion", "bulletin", "dance", "grudge", "straw", "belief", "mosquito", "electronics", "install", "insure", "judgment", "patrol", "assignment", "upset", "knife", "claim", "exile", "dominant", "culture", "joystick", "shave", "chicken", "defendant", "extort", "detective", "demonstration", "virgin", "relaxation", "contempt", "quest", "worker", "arrest", "energy", "variant", "mention", "waist", "refuse", "unpleasant", "accept", "steak", "break", "season", "houseplant", "genuine", "memory", "advantage", "radiation", "canvas", "shaft", "arise", "evolution", "beach", "adjust", "kitchen", "arena", "wealth", "loyalty", "forest", "breathe", "brake", "episode", "literacy", "responsible", "category", "positive", "import", "community", "whole", "trainer", "vague", "register", "blackmail", "occupy", "lonely", "quality", "story", "formal", "purpose", "satisfaction", "authority", "improvement", "physics", "water", "advocate", "judicial", "fantasy", "nationalist", "silver", "stress", "bloody", "feast", "morsel", "screen", "pledge", "latest", "criminal", "encourage", "right wing", "express", "review", "dictate", "specimen", "formula", "settlement", "summer", "negligence", "variety", "month", "coalition", "concentration", "river", "plane", "means", "bedroom", "committee", "unlikely", "conductor", "cooperate", "defend", "tolerate", "rotation", "agency", "country", "gravity", "crackpot", "slump", "function", "outlook", "point", "mutation", "extinct", "church", "widen", "right", "connection", "suspicion", "angel", "track", "interference", "rumor", "franchise", "turkey", "prosecute", "state", "definition", "commission", "demonstrate", "standard", "check", "calorie", "enter", "bathtub", "officer", "appearance", "convince", "similar", "species", "motif", "colon", "agony", "consensus", "efflux", "sphere", "world", "sleep", "barrier", "dynamic", "dentist", "referee", "conversation", "school", "courtship", "relief", "cotton", "relationship", "repeat", "discourage", "pilot", "prejudice", "mixture", "disability", "investment", "battlefield", "suspect", "model", "writer", "seasonal"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["Bolivia", "Cameroon", "South Africa", "Iceland", "Romania", "Israel", "Ecuador", "Estonia", "Peru", "Latvia", "Slovakia", "Slovenia", "Poland", "Tunisia", "Argentina", "Vietnam", "Georgia", "Albania", "Monaco", "Nepal"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["Goose", "Badger", "Boar", "Stork", "Kangaroo", "Anaconda", "Squirrel", "Parrot", "Hamster", "Hedgehog", "Hippo", "Beetle", "Panther", "Octopus", "Python", "Baboon", "Ferret", "Brown bear", "Pelican", "Raven"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["Bilberry", "Quince", "Cactus", "Radish", "Beetroot", "Cocoa", "Kiwi", "Mango", "Horseradish", "Figs", "Oregano", "Spruce", "Currants", "Eggplant", "Barberry", "Olive", "Broccoli", "Dill", "Spinach", "Cauliflower"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["freezer", "frying pan", "kettle", "table", "toaster", "Colander", "Spatula"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        ["Compote", "Moussaka", "Roast chicken", "Pastrami", "Olive oil", "Ravioli", "Milkshake", "Pork chop", "Chicken Soup", "Cheesecake", "French Toast", "Marzipan", "Goulash", "Meatloaf", "Burrito", "Dark chocolate", "Macaroni", "Gingerbread", "Waffle", "Barbecue"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        ["scene", "contribution", "ceremony", "survival", "circle", "gossip", "shorts", "identity", "cousin", "declaration", "merit", "mutual", "tongue", "match", "calculation", "affinity", "dictionary", "government", "sweater", "possession", "throat", "romantic", "draft", "feminine", "bride", "cabinet", "argument", "lunch", "junior", "smoke", "mislead", "assume", "condition", "refer", "association", "scratch", "implication", "theory", "respect", "influence", "inspiration", "noise", "credit", "ballet", "curriculum", "volume", "cathedral", "break", "unique", "publish", "center", "equip", "safety", "scream", "ferry", "contact", "vegetable", "practice", "opposed", "union", "memorandum", "bland", "division", "agent", "personal", "dough", "directory", "autonomy", "mutter", "asylum", "organ", "reproduce", "lounge", "broken", "reputation", "constellation", "marine", "competition", "opposite", "empire", "ghostwriter", "breed", "earwax", "tasty", "strike", "cattle", "spend", "disagreement", "average", "absorb", "slice", "eject", "monkey", "tribe", "feature", "costume", "party", "plaster", "reinforce", "bitter", "possible", "overwhelm", "established", "infection", "sausage", "trade", "guest", "habit", "bowel", "dinner", "proof", "dismiss", "drive", "trivial", "imagine", "veteran", "permanent", "trolley", "include", "licence", "teacher", "folklore", "replacement", "respectable", "spray", "appointment", "hobby", "recognize", "split", "differ", "serious", "atmosphere", "breast", "salad", "matter", "native", "magnetic", "dangerous", "demand", "unanimous", "orange", "disturbance", "supply", "orchestra", "publisher", "clerk", "childish", "clash", "nonsense", "diplomatic", "storm", "public", "module", "tactic", "palace", "control", "shelter", "embryo", "faithful", "matrix", "health", "communist", "mature", "element", "ignorant", "heaven", "organize", "girlfriend", "vessel", "attachment", "manufacture", "record", "deviation", "march", "proud", "composer", "neighborhood", "pleasure", "ballot", "combine", "verdict", "undertake", "earthflax", "child", "likely", "margin", "consciousness", "discipline", "wording", "acceptance", "experienced", "stand", "debate", "filter", "policeman", "constituency", "packet", "bottom", "cutting", "credibility", "appendix", "council", "secretary", "coincidence", "concept", "comment", "stake", "gallery", "crisis", "technique", "immune", "cell phone", "abridge", "banquet", "avant-garde", "suppress", "contain", "narrow", "drink", "candle", "release", "father", "mountain", "promotion", "fossil", "fresh", "elect", "timetable", "organisation", "computer virus", "shock", "defeat", "layer", "retiree", "system", "education", "anticipation", "novel", "corruption", "fling", "diagram", "president", "revolutionary", "gesture", "X-ray", "horseshoe", "abandon", "freeze", "appetite", "smash", "watch", "discriminate", "restaurant", "reform", "civilization", "elapse", "tumour", "shine", "density", "scatter", "old age", "advice", "debut", "rational", "rebel", "divide", "approve", "haircut", "peace", "remain", "property", "willpower", "hypothesis", "telephone", "integration", "earwax", "price", "guitar"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["Andorra", "Angola", "Armenia", "North Korea", "Indonesia", "Chile", "Lithuania", "Malaysia", "Mali", "Montenegro", "Senegal", "Paraguay", "Luxembourg", "Haiti", "Azerbaijan", "Uruguay", "Venezuela", "Iraq", "Cuba", "Jamaica"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff3, //
        ["Moose", "Condor", "Viper", "Falcon", "Guinea pig", "Trout", "Black mamba", "Jellyfish", "Reindeer", "Llama", "Swan", "Pheasant", "Quail", "Great white shark", "Salmon", "Scorpion", "Mule", "Skunk", "Gazelle", "Coyote"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Marigold", "Juniper", "Pistachio", "Ficus", "Cotton", "Basil", "Maple", "Poplar", "Clementine", "Rice", "Avocado", "Black pepper", "Celery", "Lettuce", "Mustard", "Mandarin orange", "Rose hips", "Lotus", "Thyme"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["broom", "chopsticks", "cup", "shears", "sieve", "Aluminum Foil", "Towel"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff3, //
        ["Potato salad", "Creme caramel", "Dumpling", "Pumpkin pie", "Souffle", "Cheese sandwich", "Stew", "Pickled cucumbers", "Pretzel", "Currywurst", "Pistachio", "Couscous", "Grilled cheese", "Mozzarella", "Parmesan", "Fried Rice", "Biscuits", "Sushi", "Apple Pie", "Fish and chips"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        ["creep", "dressing", "stadium", "sharp", "material", "aquarium", "diameter", "freckle", "variable", "mainstream", "offer", "borrow", "first-hand", "favor", "large", "transition", "ceiling", "resident", "offender", "flatware", "daughter", "advertise", "abolish", "glimpse", "principle", "qualify", "random", "absolute", "symptom", "industry", "drama", "deserve", "college", "floor", "thread", "racism", "mechanical", "chimney", "switch", "harbor", "medicine", "incident", "censorship", "circulation", "crowd", "wrist", "crosswalk", "baseball", "glance", "scenario", "ministry", "photocopy", "spell", "present", "crutch", "carriage", "light", "athlete", "environmental", "quiet", "confine", "follow", "enthusiasm", "stock", "identification", "greeting", "environment", "restoration", "convenience", "double", "effort", "possibility", "nightmare", "ideal", "revise", "hemisphere", "sweat", "unrest", "breeze", "delay", "texture", "automatic", "seminar", "biscuit", "green", "bitch", "holiday", "uncertainty", "visible", "director", "indoor", "construct", "hilarious", "characteristic", "determine", "cream", "smile", "forbid", "exemption", "float", "sting", "detail", "whisper", "waste", "guess", "shout", "grain", "mercy", "funny", "cycle", "healthy", "swallow", "majority", "behavior", "corpse", "cooperative", "treatment", "abundant", "architecture", "change", "tract", "horse", "afford", "sweep", "sleeve", "dramatic", "ambiguity", "convict", "smart", "conventional", "assumption", "addicted", "patent", "progress", "financial", "example", "lobby", "captain", "jockey", "cooperation", "systematic", "parking", "miscarriage", "sound", "reason", "master", "virus", "personality", "bishop", "decade", "spokesperson", "chalk", "unlike", "kidnap", "abnormal", "refrigerator", "board", "beautiful", "balance", "swipe", "proposal", "transport", "service", "vertical", "breakdown", "ensure", "overlook", "trick", "modernize", "monarch", "trend", "receipt", "explosion", "distinct", "smooth", "fairy", "amber", "conflict", "horror", "laundry", "increase", "relate", "accessible", "picture", "airplane", "attraction", "interactive", "reptile", "miserable", "captivate", "pastel", "mosaic", "normal", "recommendation", "administration", "marketing", "beard", "monopoly", "reward", "general", "promise", "blank", "grateful", "isolation", "diplomat", "Sunday", "amputate", "endorse", "terrace", "fitness", "confidence", "beginning", "layout", "laborer", "indication", "dominate", "constitutional", "ice cream", "rubbish", "overall", "reverse", "transfer", "spirit", "depression", "lineage", "report", "software", "bundle", "actor", "hospital", "choke", "future", "different", "queue", "stroke", "behave", "update", "celebration", "pigeon", "slide", "recover", "plagiarize", "welcome", "share", "multiply", "teenager", "foreigner", "statement", "finished", "spine", "manufacturer", "bullet", "trench", "society", "mayor", "belong", "technology", "plaintiff", "separation", "retreat", "attention", "interrupt", "linear", "regulation", "order", "chemistry", "island", "chapter", "activity", "sickness", "therapist", "litigation"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff4, //
        ["Afghanistan", "Saudi Arabia", "Ivory Coast", "Bahamas", "Bahrain", "Costa Rica", "El Salvador", "Kenya", "Guatemala", "Honduras", "Jordan", "Lebanon", "Qatar", "Panama", "Liberia", "Singapore", "Thailand", "Yemen", "Malta", "Vatican"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff4, //
        ["Beaver", "King cobra", "Flamingo", "Albatross", "Seagull", "Jackal", "Lark", "Loris", "Lobster", "Marten", "Walrus", "Mink", "Bison", "Porcupine", "Red Panda", "Salamander", "Stingray", "Nightingale", "Otter", "Herring"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff4, //
        ["Aloe vera", "Fern", "Chestnut", "Eucalyptus", "Birch", "Alder", "Rhubarb", "Date palm", "Lentils", "Asparagus", "Palm", "Carnation", "Flax", "Tobacco", "Okra", "Clover", "Hops", "Mistletoe", "Magnolia", "Snowdrop"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff4, //
        ["carafe", "grater", "percolator", "soap", "spatula", "sponge", "spoon"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff4, //
        ["Pesto", "Tomato sauce", "Muesli", "Swiss cheese", "Tortilla", "Baklava", "Curry", "Guacamole", "White chocolate", "Vinegar", "Hot chocolate", "Dim sum", "Pasta carbonara", "Rice pudding", "Roast beef", "Muffin", "Chocolate Cake", "Vegetable soup", "Noodle soup", "Caesar salad"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff4, //
        ["introduce", "photography", "voyage", "brand", "mourning", "convulsion", "exposure", "conviction", "thesis", "paragraph", "spider", "nuance", "leadership", "address", "session", "motorist", "mechanism", "harmful", "discuss", "problem", "protection", "deprivation", "berry", "drawing", "inhibition", "sport", "excavation", "competence", "inappropriate", "essential", "appoint", "morale", "shiver", "installation", "mistreat", "mirror", "facade", "generation", "rehearsal", "withdraw", "image", "sense", "observer", "shame", "reduce", "wriggle", "particle", "chaos", "climate", "twilight", "syndrome", "craft", "resignation", "output", "timber", "auction", "challenge", "entertain", "perform", "incapable", "estate", "moral", "object", "confusion", "rotate", "seize", "fashion", "enjoy", "employ", "direction", "migration", "aloof", "mother", "colleague", "tolerant", "bucket", "troop", "publication", "moment", "kneel", "gravel", "arrangement", "fraction", "testify", "cable", "presidential", "ample", "other", "spring", "strikebreaker", "useful", "forge", "prize", "pardon", "presence", "ivory", "provincial", "preparation", "indirect", "butterfly", "ideology", "birthday", "disaster", "crystal", "attack", "assertive", "promote", "surprise", "virtue", "employee", "false", "touch", "tribute", "economy", "vegetation", "stuff", "sequence", "legend", "behead", "plain", "stitch", "article", "tooth", "distribute", "vehicle", "outer", "reference", "survey", "freighter", "distance", "shower", "printer", "reduction", "perfume", "harass", "trunk", "patch", "absorption", "convert", "thigh", "strip", "soprano", "interest", "witch", "appeal", "admit", "injury", "invite", "ghost", "attic", "threshold", "extract", "accountant", "delete", "essay", "settle", "grace", "buttocks", "fabricate", "unity", "character", "blame", "evaluate", "rotten", "sailor", "flood", "flower", "hammer", "goalkeeper", "frequency", "drift", "measure", "pluck", "modest", "commitment", "exceed", "expansion", "trait", "fountain", "temperature", "chauvinist", "exclude", "depart", "compensation", "polish", "prescription", "Venus", "distort", "pottery", "precision", "mosque", "concrete", "thick", "steel", "multimedia", "important", "sensation", "capture", "coincide", "confront", "hunting", "eagle", "stool", "precede", "clock", "terminal", "thirsty", "infect", "intensify", "retailer", "astonishing", "plant", "choose", "monstrous", "midnight", "digress", "siege", "coerce", "cater", "payment", "economic", "parachute", "observation", "productive", "solve", "conservation", "stroll", "treaty", "stride", "brown", "animal", "scramble", "perfect", "program", "convention", "force", "angle", "provide", "passage", "sermon", "cultural", "clear", "hostility", "contemporary", "remedy", "soldier", "driver", "medium", "crevice", "available", "gradient", "rainbow", "nationalism", "superior", "pedestrian", "thanks", "family", "reserve", "cancel", "flash", "difference", "ignite", "steward", "budget", "manner"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff5, //
        ["Antigua and Barbuda", "Brunei", "Burundi", "Ethiopia", "Philippines", "Gambia", "Kazakhstan", "Laos", "Liechtenstein", "Barbados", "Madagascar", "San Marino", "Syria", "Somalia", "Sudan", "Togo", "Uganda", "Zambia", "Zimbabwe", "Benin"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff5, //
        ["Alpaca", "Armadillo", "Chinchilla", "Echidna", "Raccoon", "Egret", "Tasmanian devil", "Komodo dragon", "Barracuda", "Magpie", "Manatee", "Prairie dog", "Starling", "Tapir", "Tarsier", "Lemur", "Meerkat", "Guineafowl", "Possum"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff5, //
        ["Anise", "Bonsai", "Daisy", "Pomegranate", "Bamboo", "Wheat", "Brussels sprouts", "Chickpeas", "Wasabi", "Sequoia", "Snapdragon", "Venus flytrap", "Anemone", "Papaya", "Fennel", "Parsnip", "Pomelo", "Rosemary", "Chrysanthemum", "Ginger"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff5, //
        ["kitchen", "knife", "napkin", "refrigerator", "teapot", "thermometer", "sink"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff5, //
        ["Cottage cheese", "Paella", "Gnocchi", "Ratatouille", "Tortellini", "Shawarma", "Tofu", "Cordon Bleu", "Kefir", "Ground beef", "Falafel", "Ricotta", "Eclair", "Hummus", "Tzatziki sauce", "Tiramisu", "Potato wedges", "Antipasto", "Strudel", "Gravy"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff5, //
        ["execute", "quote", "remind", "define", "private", "black", "eavesdrop", "queen", "expose", "elbow", "escape", "brilliance", "work out", "temporary", "swarm", "volunteer", "constant", "clothes", "blast", "cigarette", "abbey", "instinct", "stimulation", "format", "decisive", "hierarchy", "offspring", "apparatus", "blue jeans", "decay", "stamp", "fascinate", "trustee", "shareholder", "generate", "mastermind", "complication", "youth", "decline", "revival", "strain", "grave", "figure", "pudding", "partnership", "spare", "realize", "biology", "indulge", "exclusive", "performer", "prisoner", "arrange", "plastic", "pressure", "communication", "fruit", "cross", "salesperson", "utter", "notice", "critical", "enemy", "sacred", "remark", "skilled", "parallel", "accompany", "lover", "handy", "radiation", "sentence", "deficiency", "preach", "sight", "relieve", "studio", "disclose", "cruelty", "researcher", "extend", "compact", "faint", "misery", "leave", "sympathetic", "infinite", "funeral", "recruit", "worry", "consumer", "peasant", "benefit", "firefighter", "liver", "reservoir", "revolution", "pupil", "insight", "landowner", "eyebrow", "stubborn", "lecture", "century", "gloom", "egg white", "pyramid", "drown", "market", "candidate", "office", "carry", "referral", "concern", "opponent", "visual", "reckless", "forward", "commemorate", "place", "federation", "adoption", "paper", "treat", "excavate", "highway", "white", "courtesy", "presentation", "sanctuary", "portion", "strength", "craftsman", "housewife", "struggle", "nominate", "steam", "ambiguous", "nerve", "minimum", "development", "mouse", "suitcase", "bless", "weight", "flock", "cover", "poetry", "salon", "yearn", "cabin", "highlight", "portrait", "revoke", "hostage", "legislation", "regular", "theorist", "feather", "improve", "fibre", "domestic", "notebook", "direct", "minute", "continuation", "method", "offense", "sunrise", "blade", "particular", "critic", "hardware", "musical", "restrict", "speculate", "bracket", "reach", "sweet", "fence", "achieve", "rebellion", "ethnic", "exempt", "sector", "grandmother", "prison", "opposition", "swell", "fool around", "orthodox", "exploit", "pleasant", "wear out", "letter", "serve", "trust", "smell", "voter", "hesitate", "option", "patient", "guard", "rehabilitation", "action", "short", "scrape", "archive", "neighbour", "grass", "channel", "bubble", "brain", "conscience", "champagne", "second", "aviation", "destruction", "qualification", "panic", "flawed", "position", "support", "tournament", "ostracize", "urine", "awful", "reliable", "wheat", "stain", "equinox", "waterfall", "faith", "annual", "temple", "decide", "representative", "frown", "deposit", "charity", "squash"]);
  }
}
