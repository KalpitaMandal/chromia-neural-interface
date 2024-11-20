import chalk from "chalk";
import { ChromiaDB } from "../services/chromia";
import { llm } from "../services/openai";

export class MemoryTool {
    constructor(private db: ChromiaDB, private sessionId: string) {
    }

    async convo(systemPrompt: string, content: any[]) {
        const messages = [{ role: "system", content: systemPrompt}, ...content];
        console.log(chalk.bgYellow(chalk.black(JSON.stringify(messages, null, 2))));
        return llm.chat.completions.create({
            model: "grok-beta",
            messages,
        });
    }

    async updateLongTermMemory(content: string) {
        const currentLongTermMemory = await this.db.getLongTermMemory(this.sessionId);
        const prompt = `Act as a professional notetaker, you will be given an existing long term memory of a character and recent conversation, please update the memory of the character. Please do not add additional contexts if it doesn't exist, only update the memory.

### Old Memory        
${currentLongTermMemory}

### Recent Conversation
${content}`

        const response = await llm.chat.completions.create({
            model: "grok-beta",
            messages: [{ role: "system", content: prompt }],
        });

        const newLongTermMemory = response.choices[0].message.content;
        await this.db.createOrEditLongTermMemory(this.sessionId, newLongTermMemory!);
        return newLongTermMemory!;
    }





}