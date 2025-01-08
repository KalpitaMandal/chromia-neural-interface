import OpenAI from "openai";

export const llm = new OpenAI({
    // baseURL: "https://api.x.ai/v1",
    baseURL: "https://api.groq.com/openai/v1",
    apiKey: process.env.XAI_API_KEY,
});