# PreviewIt — Instant Web Code Preview & Converter

PreviewIt is a powerful, secure, and blazing-fast tool designed for professionals who need to instantly render and share web components. 

Whether you are designing a new landing page, refining a UI component, or rapidly prototyping across different frameworks, PreviewIt removes all the friction. Simply drop your core files into the interface and watch them come alive in fully interactive, real-time mockups.

---

## Core Features

* **Live Device Previews**
  Instantly view your code rendered inside a realistic browser chrome, tablet, or premium mobile mockup. Switch between viewport environments with a single click—no page reloads required.

* **Seamless Multi-Format Support**
  Bring your files and let the engine do the rest. PreviewIt natively supports and dynamically compiles over 14 different development formats instantly, including:
  * TypeScript & JavaScript (React JSX/TSX)
  * HTML5 & Vanilla JS
  * Vue 3 SFC & Svelte
  * CSS, SCSS, & Markdown

* **The Code Converter**
  Transitioning codebases? Use the built-in intelligent converter to translate your logic across multiple formats. Watch exactly what changed between the input and output with the unified side-by-side diffing viewer.

* **Frictionless Sharing**
  Generate a shareable link in a single click. Send your active web preview to clients, designers, or team members instantly. No account sign-ups, no paywalls, and absolutely no friction.

---

## Security & Performance by Design

Unlike traditional cloud IDEs or delayed server-side renderers, PreviewIt operates as a heavily optimized **browser-native** sandboxed environment. Your code is compiled and processed securely using the exact same library trees that power the original frameworks.
- **Zero Latency**: Compilations and transpilations are instant. 
- **100% Private**: Your proprietary source code never leaves your local hardware or touches an external cloud API. 

---

##  How to Launch

PreviewIt is distributed as a complete local suite. To start using the platform:

**1. Initialize the Core Application Services**
```powershell
cd PreviewIt.Server
dotnet run
```

**2. Launch your User Interface**
```powershell
cd previewit_svelte
npm install
npm run dev
```

Finally, open your web browser and navigate seamlessly to `http://localhost:5173` to start previewing immediately.

---

##  License
A development tool built to save you time. Distributed freely under the MIT License.
