
#let institute = (
  de: "Technische Hochschule Mannheim",
  en: "University of Applied Sciences Mannheim",
)

#let faculties = (
  I: (de: "Fakultät für Informatik", en: "Department of Computer Science"),
  E: (de: "Fakultät für Elektrotechnik", en: "Department of Electrical Engineering"),
  S: (de: "Fakultät für Sozialwesen", en: "Department of Social Work"),
  B: (de: "Fakultät für Biotechnologie", en: "Department of Biotechnology"),
  D: (de: "Fakultät für Gestaltung", en: "Department of Design"),
  M: (de: "Fakultät für Maschinenbau", en: "Department of Mechanical Engineering"),
  N: (de: "Fakultät für Informationstechnik", en: "Department of Information Technology"),
  W: (de: "Fakultät für Wirtschaftsingenieurwesen", en: "Department of Engineering and Management"),
  V: (de: "Fakultät für Verfahrens- und Chemietechnik", en: "Department of Chemical Process Engineering"),
)

#let bsc = [Bachelor of Science (B.Sc.)]
#let ba = [Bachelor of Arts (B.A.)]
#let msc = [Master of Science (M.Sc.)]
#let ma = [Master of Arts (M.A.)]

#let courses-of-study = (
  IB:   (
    de: "Informatik",
    en: "Computer Science",
    type-de: "Bachelor-Thesis",
    type-en: "Bachelor Thesis",
    degree: bsc),
  IMB:  (
    de: "Medizinische Informatik",
    en: "Medical Informatics",
    type-de: "Bachelor-Thesis",
    type-en: "Bachelor Thesis",
    degree: bsc),
  UIB:  (
    de: "Unternehmens- und Wirtschaftsinformatik",
    en: "Enterprise Computing",
    type-de: "Bachelor-Thesis",
    type-en: "Bachelor Thesis",
    degree: bsc),
  CSB:  (
    de: "Cyber Security",
    en: "Cyber Security",
    type-de: "Bachelor-Thesis",
    type-en: "Bachelor Thesis",
    degree: bsc),
  IM:   (
    de: "Informatik",
    en: "Computer Science",
    type-de: "Master-Thesis",
    type-en: "Master Thesis",
    degree: msc),
  MEB:  (
    de: "Mechatronik",
    en: "Mechatronic",
    type-de: "Bachelor-Thesis",
    type-en: "Bachelor Thesis",
    degree: bsc),
  UB:   (
    de: "Automatisierungstechnik",
    en: "Automation Technology",
    type-de: "Bachelor-Thesis",
    type-en: "Bachelor Thesis",
    degree: bsc),
  ELB:  (
    de: "Elektro- und Informationstechnik/Ingenieurpädagogik",
    en: "Elektro- und Informationstechnik/Ingenieurpädagogik",
    type-de: "Bachelor-Thesis",
    type-en: "Bachelor Thesis",
    degree: bsc),
  EBE:  (
    de: "Energietechnik und erneuerbare Energien",
    en: "Power Engineering ans Renewable Energies",
    type-de: "Bachelor-Thesis",
    type-en: "Bachelor Thesis",
    degree: bsc),
  TS:   (
    de: "Translation Studies",
    en: "Translation Studies",
    type-de: "Bachelor-Thesis",
    type-en: "Bachelor Thesis",
    degree: ba),
  EM:   (
    de: "Automatisierungs- und Energiesysteme",
    en: "Automation and Energy Systems",
    type-de: "Master-Thesis",
    type-en: "Master Thesis",
    degree: msc),
  ELM:  (
    de: "Lehramt Ingenieurpädagogik",
    en: "Lectureship Educational Engineering",
    type-de: "Master-Thesis",
    type-en: "Master Thesis",
    degree: msc),
  SAB:  (
    de: "Soziale Arbeit",
    en: "Social Labour",
    type-de: "Bachelor-Thesis",
    type-en: "Bachelor Thesis",
    degree: ba),
  SAM:  (
    de: "Soziale Arbeit",
    en: "Social Labour",
    type-de: "Master-Thesis",
    type-en: "Master Thesis",
    degree: ma),
  BB:   (
    de: "Biotechnology",
    en: "Biotechnology",
    type-de: "Bachelor-Thesis",
    type-en: "Bachelor Thesis",
    degree: bsc),
  BCB:  (
    de: "Biologische Chemie",
    en: "Biological Chemics",
    type-de: "Bachelor-Thesis",
    type-en: "Bachelor Thesis",
    degree: bsc),
  BMEBST: (
    de: "Biotechnology - Biomedical Science and Technology",
    en: "Biotechnology - Biomedical Science and Technology",
    type-de: "Master-Thesis",
    type-en: "Master Thesis",
    degree: msc),
  BMEBPD: (
    de: "Biotechnology - Bioprocess Development",
    en: "Biotechnology - Bioprocess Development",
    type-de: "Master-Thesis",
    type-en: "Master Thesis",
    degree: msc),
  BLSM: (
    de: "Life Science Management",
    en: "Life Science Management",
    type-de: "Master-Thesis",
    type-en: "Master Thesis",
    degree: msc),
  KDB:  (
    de: "Kommunikationsdesign",
    en: "Communication Design",
    type-de: "Bachelor-Thesis",
    type-en: "Bachelor Thesis",
    degree: ba),
  KDM:  (
    de: "Kommunikationsdesign",
    en: "Communication Design",
    type-de: "Master-Thesis",
    type-en: "Master Thesis",
    degree: ma),
  MB:   (
    de: "Maschinenbau",
    en: "Mechanical Engineering",
    type-de: "Bachelor-Thesis",
    type-en: "Bachelor Thesis",
    degree: bsc),
  MM:   (
    de: "Maschinenbau",
    en: "Mechanical Engineering",
    type-de: "Master-Thesis",
    type-en: "Master Thesis",
    degree: msc),
  NEB:  (
    de: "Elektronik",
    en: "Electronics",
    type-de: "Bachelor-Thesis",
    type-en: "Bachelor Thesis",
    degree: bsc),
  TIB:  (
    de: "Technische Informatik",
    en: "Technical Information Technology",
    type-de: "Bachelor-Thesis",
    type-en: "Bachelor Thesis",
    degree: bsc),
  MTB:  (
    de: "Medizintechnik",
    en: "Medical Technology",
    type-de: "Bachelor-Thesis",
    type-en: "Bachelor Thesis",
    degree: bsc),
  MTM:  (
    de: "Medizintechnik",
    en: "Medical Technology",
    type-de: "Master-Thesis",
    type-en: "Master Thesis",
    degree: msc),
  NM:   (
    de: "Informationstechnik",
    en: "Informationstechnik",
    type-de: "Master-Thesis",
    type-en: "Master Thesis",
    degree: msc),
  WB:   (
    de: "Wirtschaftsingenieurwesen",
    en: "Engineering and Management",
    type-de: "Bachelor-Thesis",
    type-en: "Bachelor Thesis",
    degree: bsc),
  WM:   (
    de: "Wirtschaftsingenieurwesen",
    en: "Engineering and Management",
    type-de: "Master-Thesis",
    type-en: "Master Thesis",
    degree: msc),
  WMI:  (
    de: "Wirtschaftsingenieurwesen",
    en: "Engineering and Management",
    type-de: "Master-Thesis",
    type-en: "Master Thesis",
    degree: msc),
  WMB:  (
    de: "Wirtschaftsingenieurwesen mit den ingenieurwissenschaftlichen Fachrichtungen Maschinenbau und Elektrotechnik", 
    en: "Engineering and Management with focus on Mechanical and Electrical Engineering", 
    type-de: "Master-Thesis", 
    type-en: "Master Thesis", 
    degree: msc),
  WMW:  (
    de: "Wirtschaftsingenieurwesen mit ingenieurwissenschaftlicher Vertiefung des Maschinenbaus",
    en: "Engineering and Management deepening the engineering aspects of Mechanical Engineering",
    type-de: "Master-Thesis",
    type-en: "Master Thesis",
    degree: msc),
  VB:   (
    de: "Verfahrenstechnik",
    en: "Process Engineering",
    type-de: "Bachelor-Thesis",
    type-en: "Bachelor Thesis",
    degree: bsc),
  CB:   (
    de: "Chemische Technik",
    en: "Chemical Engineering",
    type-de: "Bachelor-Thesis",
    type-en: "Bachelor Thesis",
    degree: bsc),
  CM:   (
    de: "Chemieingenieurwesen",
    en: "Chemical Engineering",
    type-de: "Master-Thesis",
    type-en: "Master Thesis",
    degree: msc),
)
