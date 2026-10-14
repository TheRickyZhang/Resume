#import "@preview/simple-technical-resume:0.1.0": *

#let name = "Ricky Zhang"
#let phone = "____________"
#let email = "__________"
#let github = "therickyzhang"
#let linkedin = "therickyzhang"
#let personal-site = "therickyzhang.com"

// Link to Latex: https://www.overleaf.com/project/66db91a8e01fa87bf14863b6

// Converts datetime format into readable period.
#let period_worked(start-date, end-date) = {
  // sanity checks
  assert.eq(type(start-date), datetime)
  assert(type(end-date) == datetime or type(end-date) == str)

  if type(end-date) == str and end-date == "Present" {
    end-date = datetime.today()
  }

  let today = datetime.today()
  return [
    #start-date.display("[month repr:short] [year]") --
    #if (
      (end-date.year() == today.year())
        and (end-date.month() == today.month())
        and (today.day() <= end-date.day())
    ) [
      Present
    ] else [
      #end-date.display("[month repr:short] [year]")
    ]
  ]
}

// The package's headings close over its own period_worked, so redefine them here.
#let heading-2x2(cols, r1c1, r1c2, r2c1, r2c2) = {
  grid(
    columns: cols,
    align(left)[#r1c1 \ #r2c1],
    align(right)[#r1c2 \ #r2c2],
  )
}

#let work-heading(title, company, location, start-date, end-date, body) = {
  heading-2x2(
    (1fr, 1fr),
    [*#title*], [*#period_worked(start-date, end-date)*],
    [#company], emph(location),
  )
  v(-0.2em)
  if body != [] {
    v(-0.4em)
    set par(leading: 0.6em)
    set list(indent: 0.5em)
    body
  }
}

#let education-heading(institution, location, degree, major, start-date, end-date, body) = {
  heading-2x2(
    (70%, 30%),
    [*#institution*], [*#location*],
    [#degree, #major], period_worked(start-date, end-date),
  )
  v(-0.2em)
  if body != [] {
    v(-0.4em)
    set par(leading: 0.6em)
    set list(indent: 0.5em)
    body
  }
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
    Coursework: DSA, OS, Competitive Programming, Combinatorics, Graph Theory #h(1fr) GPA: 3.97
  ]
]

#custom-title("Skills")[
  #skills()[
    - *Programming Languages: * C++, Java, Python, Lua, Typst, TypeScript, Rust, Bash, SQL
    - *Libraries/Tools:* Linux, GoogleTest, Google Benchmark, Boost, FuzzTest, perf, ImGui, Docker, Kafka
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
  - Co-built a *kernel-bypass* market maker for 13 equities in a team of 3, reaching *sub-5us p99* tick-to-trade
  - Explored "leapfrogging" bracket update dynamics, optimized order book internals, and engineered risk checks
  - Designed and benchmarked an *options exchange* from scratch, following a custom wire spec
  - Parameterized synthetic order flow and benchmarked pooled vs inline payloads for queue and book entries
  ]


  #work-heading(
    "Software Engineering Intern",
    emph[Sumitomo Mitsui Banking Corporation],
    "New York, NY",
    datetime(year: 2025, month: 6, day: 1),
    datetime(year: 2025, month: 8, day: 1),
  )[
    - Built and integrated a *cash-flow* pipeline for interest rate swaps with Spring Boot, Kafka, and RHEL
    - Contributed to migration of quant library components (futures, yield curves, swaps) from C++ to Java
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

  /* #work-heading(
    "Lead Developer",
    emph[Florida Community Innovation Foundation, Inc.],
    "Gainesville, FL",
    datetime(year: 2023, month: 11, day: 1),
    datetime(year: 2024, month: 11, day: 1),
  )[
    - Led *Florida Resource Map* (FRM) web development, connecting social workers to 2000+ trusted resources
    - Worked with SWE/CX/PR teams, contractors, and 7 charity partners from *planning to GA* in one year
  ]
  */

  #work-heading(
    "Undergraduate Researcher",
    emph[Geoplexity Research Group],
    "Gainesville, FL",
    datetime(year: 2024, month: 1, day: 1),
    datetime(year: 2024, month: 8, day: 1),
  )[
    - Devised C++/Nauty algorithms with Dr. Sitharam's group to detect rigid partial 3-tree elements
    - Optimized constraint-graph roadmap computation for 60% speed improvements over hash-map methods
  ]

  #work-heading(
    "Teaching Assistant",
    emph[University of Florida],
    "Gainesville, FL",
    datetime(year: 2024, month: 1, day: 1),
    datetime(year: 2026, month: 5, day: 1),
  )[
    - Taught Competitive Programming, C++ Fundamentals, and Discrete Math
  ]
]

#custom-title("Involvement")[
  #project-heading(
    "President — UF Quant Club" + h(1fr) + [ January 2026 -- Present ],
  )[
    - Lead a *100+ member* quantitative finance organization backed by \$3,000 in firm sponsorships
    - Hosted weekly interview prep sessions for trading and development roles
  ]


  #grid(
    columns: (3fr, 1fr),
    [*Webmaster — UF Society of Asian Scientists and Engineers (SASE)*],
    [#align(right)[*#period_worked(datetime(year: 2024, month: 6, day: 1), datetime(year: 2025, month: 5, day: 1))*]],
  )
  #v(-0.5em)
  #set par(leading: 0.6em)
  #set list(indent: 0.5em)
  - Hosted workshops for *60+ attendees* on websockets, SSG/SSR architecture, and industry practices
  - Spearheaded a team of 18 to develop a website with React Query, TanStack, Tailwind, and Turso
]

#custom-title("Projects")[
  #project-heading(
    "Vimficiency | " + emph[C++, Lua] + h(1fr) + [ Dec 2025 -- Present ],
  )[
    - Analyzes editing actions as a *Neovim plugin* that recommends more efficient Vim command sequences
    - Uses *Anytime Repairing A\* * search across motion/edit/composition optimizers with customizable effort
    - Integrates a Lua editor layer with an in-process C++ analysis engine via a C ABI
    - Built through *LLM-assisted development* at scale, gated by property, fuzz, and approval test suites
    // - Adapts over time, maintains a database of things
  ]

  #project-heading(
    "3D Game Engine (Battlebeyz) | " + emph[C++, OpenGL, ImGui] + h(1fr) + [May 2024 -- Feb 2025],
  )[
    - Developed a *3D renderer* and *custom physics engine* from scratch using low-level graphics libraries
    - Improved heuristic-based simulation accuracy for *spinning tops* over existing physics engines
    - Optimized architecture with multithreading, memory management, and performance profiling
  ]
]


#custom-title("Awards/Certifications")[
  Top 750 Putnam, Akuna Options 201, 3rd Place ICPC Regionals
]

