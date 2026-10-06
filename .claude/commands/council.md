---
description: Pressure-test a high-stakes decision with a 5-advisor council, anonymous peer review, and a chairman synthesis. Outputs a scannable HTML brief.
argument-hint: <the decision or question to pressure-test>
---

# /council: Decision Pressure-Test

Convene a virtual council of five advisors to stress-test a high-stakes decision, then synthesize their input into a single recommendation [USER_NAME] can scan in 60 seconds.

**Use this for decisions that actually matter** (strategic forks, big spends, pivots, hires, launches). Skip it for tactical day-to-day calls. If the question is too small to warrant it, say so.

## Input

The decision is in `$ARGUMENTS`. If empty, ask [USER_NAME]: *"What decision do you want the council to pressure-test?"* One question, then proceed.

If the decision maps to a project or area, **read its COP first** (`50_Projects/COP - {Name}.md` or `40_Areas/Area - {Name}/COP - {Name}.md`) to ground the council in real facts, constraints, and the running estimate. Also read the Constraints section of `10_Command Center/My Mission Document.md`.

## Process

### 1. Frame the decision
Restate the decision crisply as a clear yes/no or option-A-vs-B question. List the key facts, constraints, and what's at stake.

### 2. Convene five advisors (independent takes)
Each advisor gives an honest, independent view. No consensus-seeking yet. Tight paragraph plus a one-line verdict each.

1. **The Strategist**: long-term positioning, optionality, second-order effects.
2. **The Skeptic**: risks, failure modes, what is being assumed that might be false.
3. **The Operator**: execution reality given [USER_NAME]'s actual time, focus, and bandwidth constraints from the Mission Document.
4. **The Capital Allocator**: cost, return, payback, opportunity cost against other commitments.
5. **The Customer or Stakeholder Advocate**: does the person on the receiving end actually want this?

### 3. Anonymous peer review
Each advisor reviews the other four takes (presented without authorship) and flags the single strongest point and the single most dangerous point across the table.

### 4. Chairman synthesis
- **The crux**: the one thing this decision hinges on
- **Recommendation**: proceed / don't / proceed with conditions, with a confidence level
- **Conditions and decision triggers**: what must be true to proceed, what would change the call
- **Dissent worth keeping**: the strongest opposing view, preserved

Be direct. [USER_NAME] wants a real recommendation, not a hedge, but flag genuine uncertainty rather than projecting false confidence.

## Output

Build a single self-contained **HTML brief** (inline CSS, no external dependencies), clean theme with one accent color:

- Header: the decision and date
- "Bottom Line" box at top: recommendation and crux
- Five advisor cards
- Peer-review highlights
- Chairman synthesis with conditions and dissent

Save to `00_INBOX/[AGENT_NAME] Task Outputs/Council - {short-decision-slug} - {YYYY-MM-DD}.html`, present the file, and log to the Activity Log. If the decision belongs to a COP, add a Situation Log entry linking the brief.
