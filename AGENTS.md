# AGENTS.md — Project Guidance for AI Agents

### Project Structure
- `_RAW/`: Ignore - Binary and other objects like images, photos, and *.psd files used in the creation of the website. 
- `.agents/rules/`: Rules to be observed for AI agents. Read this before you do anything. 
- Root files: May be changed when needed for the active task, especially project-level configuration, Docker, SDK, documentation, and validation workflows.
- `html/`: May be changed when needed for the active task, except for the ignored projects listed below.


### Development Rules
- Review all individual files in `.agents/rules/`
- Review active files in `.agents/steps/`; ignore step files with the `.ignore` suffix.

---

## Development Instructions for AI Agent 


### Development Workflow

#### 1. Before Starting Changes
1. Review all files in `.agents/rules/` and active files in `.agents/steps/`
2. Review the file(s) to determine what needs to be modified

#### 2. Making Changes
1. **Plan the change**: Identify all affected files
2. **Search for dependencies**
3. **Maintain consistency**: Keep naming conventions and patterns that are considered best practice for each language.

#### 3. After Changes
1. Validate syntax
2. Check for issues
3. Plan to verify

### Completion Checks

Before considering any change complete:

- Re-check relevant references and dependencies.
- Validate syntax and run the relevant build, test, or Docker command when possible.
- Update documentation when the rules or the change require it.
- Confirm ignored directories and projects were not modified.

### Remember

1. **Read before writing**: Understand the existing structure
2. **Search before changing**: Find all dependencies
3. **Plan before applying**
4. **Document complex logic**: Add comments for non-obvious code


### Git & PR Guidelines
- I will handle git, commits, branches, and merges manually for now. Don't do any of it.
<!-- 
- **Branching**: Use `feature/`, `fix/`, or `refactor/` prefixes.
- **Commits**: Follow conventional commits (e.g., `feature: add user login`).
- **Review**: Review your work before proposing a merge.
-->
