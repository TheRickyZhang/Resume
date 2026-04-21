#import "@preview/simple-technical-resume:0.1.0": *

#let name = "Ricky Zhang"
#let phone = "____________"
#let email = "__________"
#let github = "therickyzhang"
#let linkedin = "therickyzhang"
#let personal-site = "therickyzhang.com"

// Converts datetime format into readable period.
#let period_worked(start-date, end-date) = {
  // sanity checks
  assert.eq(type(start-date), datetime)
  assert(type(end-date) == datetime or type(end-date) == str)

  if type(end-date) == str and end-date == "Present" {
    end-date = datetime.today()
  }

  return [
    #start-date.display("[month repr:short] [year]") --
    #if (
      (end-date.month() == datetime.today().month()) and (end-date.year() == datetime.today().year())
    ) [
      Present
    ] else [
      #end-date.display("[month repr:short] [year]")
    ]
  ]
}

#show: resume.with(
  top-margin: 0.35in,
  personal-info-font-size: 10pt,
  author-position: center,
  personal-info-position: center,
  author-name: name,
  phone: phone,
  email: email,
  // website: personal-site,
  linkedin-user-id: linkedin,
  github-username: github,
  font-size: 11.0pt,
)

#custom-title("Education")[
  #education-heading(
    "University of Florida",
    "Gainesville, FL",
    "Bachelor of Science",
    "Computer Science and Mathematics",
    datetime(year: 2023, month: 8, day: 1),
    datetime(year: 2027, month: 5, day: 1),
  )[
    Relevant Coursework: Data Structures & Algorithms, Operating Systems, SWE, Databases #h(1fr) GPA: 3.97
  ]
]

#custom-title("Skills")[
  #skills()[
    - *Programming Languages: * C++, Java, Python, Typst, Lua, Rust, TypeScript, Bash
    - *Frameworks/Libraries: * Boost, ImGui, React, Spring Boot, JavaFX, .NET,
    - *Tools/Platforms: * Linux, GDB, Doxygen, Docker, Kafka, GTest, MongoDB, Jira, Confluence
  ]
]

#custom-title("Work Experience")[
  #work-heading(
    "Trading Systems Engineering Intern",
    emph[Susquehanna International Group (SIG)],
    "Bala Cynwyd, PA",
    datetime(year: 2026, month: 6, day: 1),
    datetime(year: 2026, month: 8, day: 7),
  )[
    - Incoming Summer 2026, Low-latency C++
  ]


  #work-heading(
    "Software Engineering Intern (Pricing)",
    emph[Sumitomo Mitsui Banking Corporation],
    "New York, NY",
    datetime(year: 2025, month: 6, day: 1),
    datetime(year: 2025, month: 8, day: 1),
  )[
    - Built and integrated a *cash-flow pipeline for interest rate swaps* with Spring Boot, Kafka, and RHEL
    - Contributed to migration of C++ quant library components (futures, yield curves, swaps) to Java
    - Achieved 30% faster Maven builds for pricer service and QA API by cleaning legacy technical debt
  ]

  // #work-heading(
  //   "Technology Fellow",
  //   emph[Youth Civic Hub],
  //   "New York, NY",
  //   datetime(year: 2024, month: 9, day: 1),
  //   datetime(year: 2024, month: 12, day: 1),
  // )[
  //   - Refactored a Gatsby/GraphQL codebase for 4x faster builds and 80% lower hosting costs
  // ]
  //
  #work-heading(
    "Lead Developer",
    emph[Florida Community Innovation Foundation, Inc.],
    "Gainesville, FL",
    datetime(year: 2023, month: 11, day: 1),
    datetime(year: 2024, month: 11, day: 1),
  )[
    - Led *Florida Resource Map* (FRM) web development, connecting social workers to 2000+ trusted resources
    - Worked with SWE/CX/PR teams, contractors, and 7 charity partners from *planning to GA* in one year
    - Promoted from intern to lead; coordinated standups, grooming calls, CI/CD with the MERN stack
  ]

  #work-heading(
    "Undergraduate Researcher",
    emph[Geoplexity Research Group],
    "Gainesville, FL",
    datetime(year: 2024, month: 2, day: 1),
    datetime(year: 2024, month: 8, day: 1),
  )[
    - Devised C++/Nauty algorithms with Dr. Sitharam's group to detect rigid partial 3-tree elements
    - Optimized constraint-graph roadmap computation for 60% speed improvements over hash map methods
  ]

  #work-heading(
    "Teaching Assistant",
    emph[University of Florida],
    "Gainesville, FL",
    datetime(year: 2024, month: 1, day: 1),
    datetime(year: 2025, month: 5, day: 1),
  )[
    - Programming Fundamentals, Competitive Programming, Discrete Math, Calculus 2
  ]
]

#custom-title("Involvement")[
  #grid(
    columns: (3fr, 1fr),
    [*Webmaster | #emph[UF Society of Asian Scientists and Engineers (SASE)]*],
    [#align(right)[*#period_worked(datetime(year: 2024, month: 6, day: 1), datetime(year: 2025, month: 5, day: 1))*]],
  )
  #v(-0.5em)
  #set par(leading: 0.6em)
  #set list(indent: 0.5em)
  - Organized *60+ attendee workshops* on API integration, SSG/SSR architecture, and industry practices
  - Spearheaded a *team of 18* to develop a website with React Query, TanStack, Tailwind, and Turso
  - Deployed a real-time stock market simulator using Bun Websockets to 60+ concurrent GBM attendees
]

#custom-title("Projects")[
  #project-heading(
    "3D Game Engine (Battlebeyz) | " + emph[C++, OpenGL, ImGui] + h(1fr) + [May 2024 -- Feb 2025],
  )[
    - Developed a *3D renderer* and *custom physics engine* from scratch using low-level graphics libraries
    - Achieved improved heuristic-based simulation accuracy for *spinning tops* over existing physics engines
    - Optimized architecture with multithreading, memory management, and performance profiling
  ]

  #project-heading(
    "Vimficiency | " + emph[C++, Lua] + h(1fr) + [ Dec 2025 -- Present ],
  )[
    - Neovim plugin that analyzes editing actions and recommends more optimal sequences for the same outcome
    - Uses a heuristical A\* search over a customizable cost model with keystroke effort and semantic preference
  ]
  // #project-heading(
  //   "Jane Street Puzzle Programs | " + emph[Python, C++] + h(1fr) + [ Dec 2023 -- Aug 2024 ],
  // )[
  //   - Implemented algorithmic solutions for 7+ monthly Jane Street puzzles using mathematical modeling
  //   - Leveraged state-space reduction, regression analysis, and image processing with common libraries
  // ]
]


#custom-title("Awards/Certifications")[
  Top 750 Putnam, Akuna Options 201, NVIDIA Fundamentals of Deep Learning
]


