#import "include/settings.typ": *

#set document(
  title:  "Современные мобильные операционные системы, современные приложения и перспективы развития приложений для мобильных устройств разработки ИТ предприятий в Атомной Отрасли",
  author: "Багинян Артур Варданович",
  date:   datetime(year: 2026, month: 4, day: 26),
)

// Применить ГОСТ
#show: apply-gost

#counter(page).update(7)
// Содержание
#contents()

// Введение
#include "chapters/00_intro.typ"
#pagebreak()

// Глава 1 — Обзор современных мобильных ОС
#include "chapters/01_os_overview.typ"
#pagebreak()

// Глава 2 — Применение в корпоративной сфере
#include "chapters/02_corporate_use.typ"
#pagebreak()

// Глава 3 — Применение в атомной отрасли
#include "chapters/03_nuclear.typ"
#pagebreak()


// Глава 4 — Виды мобильных приложений
#include "chapters/04_app_types.typ"
#pagebreak()

// Глава 5 — Стек технологий
#include "chapters/05_tech_stack.typ"
#pagebreak()

// Глава 6 — Enterprise-приложения
#include "chapters/06_enterprise.typ"
#pagebreak()

// Заключение
#include "chapters/07_conclusion.typ"
#pagebreak()

// Использованные источники
#bibliography("ref/refs.bib")

// Приложение А - доклад
#pagebreak()
#heading(level: 1, numbering: none, outlined: true)[Приложение А]
#heading(level: 2, numbering: none, outlined: false)[Доклад по теме]

#show heading: set heading(outlined: false)
#counter(heading).update(0)
#include "report.typ"
#pagebreak()
#show heading: set heading(outlined: true)

// Приложение Б - презентация
#heading(level: 1, numbering: none, outlined: true)[Приложение Б]
#heading(level: 2, numbering: none, outlined: false)[Графический материал]

