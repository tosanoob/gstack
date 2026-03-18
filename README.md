# gstack — The Gemini CLI Productivity Suite

Hi, I'm [Garry Tan](https://x.com/garrytan). I'm President & CEO of [Y Combinator](https://www.ycombinator.com/).

**gstack** is a collection of high-leverage agentic workflows (skills) for the **Gemini CLI**. It is designed to help you rethink problems, find "10-star" product solutions, and automate the tedious parts of engineering so you can focus on building what matters.

## 🚀 One-Command Install

To install gstack and all its dependencies (Bun, Playwright, Binaries) into your home directory:

```bash
curl -fsSL https://raw.githubusercontent.com/tosanoob/gstack/main/bootstrap.sh | bash
```

### 🧠 Activating gstack
Once installed, you must tell your Gemini CLI session where to find these new capabilities. Paste this into any Gemini CLI chat:

> "Please use `save_memory` to remember: **My gstack skills are located at $HOME/.gemini/skills/gstack. Use the SKILL.md files there when I ask for /review, /qa, /plan-ceo-review, or /ship.**"

From then on, gstack becomes a global extension of your agent.

---

## 🛠️ The Workflows

gstack gives you access to a team of specialist personas:

*   **`/plan-ceo-review`**: Rethink the problem, find the "10-star" product, and challenge every premise.
*   **`/review`**: A pre-landing architectural audit. Catches race conditions, SQL safety issues, and design drift.
*   **`/qa`**: Systematic, visual QA using a headless browser. Finds bugs, writes regression tests, and fixes them in source code.
*   **`/ship`**: Prepares your PR, audits your diff, updates documentation, and lands the code.
*   **`/browse`**: A fast, headless Playwright browser that allows Gemini to "see" and interact with your site.

---

## 🌊 Core Philosophy: "Boil the Lake"

gstack follows the **Boil the Lake** principle: **When AI makes the marginal cost of completeness near-zero, always do the complete thing.** 

Don't skip edge cases to save time. Don't defer tests to a follow-up PR. If a "complete" implementation is 100 lines and a "shortcut" is 70, gstack will always recommend the 100 lines. 

[Read the full essay on Boil the Lake](https://garryslist.org/posts/boil-the-ocean).

---

## 🏗️ Project Structure

*   `/browse`: The Playwright-based browser manager.
*   `/qa`, `/review`, `/plan-*`: Markdown-defined skill workflows.
*   `setup`: Build engine and binary compiler.
*   `bootstrap.sh`: The global installer.

## License

MIT. Free forever. Go build something.
