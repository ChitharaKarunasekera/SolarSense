# SolarSense

## Description
SolarSense_01 is a project aimed at enhancing investment-oriented product recommendations, research, and decision support for solar power adoption. Leveraging advanced data analysis and large language models (LLMs), the project provides insights and recommendations for investing in solar energy solutions, particularly tailored for the context of Sri Lanka.

## Features
+ Investment Recommendations: Provides personalized product recommendations for solar power investments based on user preferences and market data.
+ Data Analysis: Utilizes advanced data analysis techniques to evaluate solar power potential, performance metrics, and financial viability.
+ Decision Support: Offers robust decision support tools to help users make informed choices about solar energy investments, including ROI calculations and payback period analysis.
+ User-Friendly Interface: Designed with a user-friendly interface for easy navigation and interaction, featuring graphical representations of data and recommendations.

## Architecture
The architecture of the SolarSense Engine comprises four main layers:

1. Data Processing and Pre-processing Layer: Collects and enhances domain-specific data.
2. LLM Training Layer: Utilizes complex Transformer-based models for fine-tuning with domain-specific data.
3. Recommendation Engine: Provides tailored product recommendations using user interactions and market data.
4. Decision Support Layer: Uses insights from the LLM to provide graphical charts for decision-making assistance.

## Key Components
+ Data Tier: Stores user profiles, product specifications, market data, pricing information, and historical recommendations.
+ Logic Tier: Handles data integration, API communication, and LLM prompting methodologies to generate recommendations.
+ Presentation Tier: Manages user interactions and displays outputs, including recommendations and analyses, using a graphical dashboard.

## LLMs Fine-Tuned Using Google Colab
Several models were fine-tuned and experimented with using Google Colab to pick the most suitable model to be integrated with the Mobile App:

  ### 1. GPT-2 Model Fine-Tuning:

  + Training Data: Domain-specific data related to solar power investments and equipment as context-questions-answers in `JSON` format.
  + Dataset: [Training Dataset](https://huggingface.co/datasets/ChitharaK/solar_power_context_questions_answers)
  + Methodology: Fine-tuned using the `GPT2LMHeadModel` of `HuggingFace Library` for question-answering 
  + Colab Notebook: [GPT-2 Fine-Tuning](https://colab.research.google.com/drive/1L-1qiMRxBHrkmdKTH129DLv-7gnpkri7?usp=sharing)
  + Issue: Not enough computational power with the free version of Colab resources to fine-tune the model with a higher no. of epochs etc.

  ### 2. ALBERT Model Fine-Tuning:

  + Training Data: Domain-specific data related to solar power investments and equipment as context-questions-answers in `JSON` format.
  + Dataset: [Training Dataset](https://huggingface.co/datasets/ChitharaK/solar_power_context_questions_answers)
  + Methodology: Fine-tuned using the `AlbertForQuestionAnswering` of `HuggingFace Library` for question-answering 
  + Colab Notebook: [ALBERT Fine-Tuning](https://colab.research.google.com/drive/1zuDOCSvo6dIarLUjcBQjPmglPiKtMLLw?usp=sharing)
  + Issue: Not enough computational power with the free version of Colab resources to fine-tune the model with a higher no. of epochs etc.

  ### 3. Gemini Model Fine-Tuning (Used in the Mobile App) :

  + Training Data: Domain-specific data related to solar power investments and equipment as input-output in `.csv` file format.
  + Dataset: [Training Dataset](https://www.researchgate.net/publication/380029412_question_answer_v2)
  + Methodology: Follows fine-tuning, prompt engineering, and simplified RAG 
  + Colab Notebook: [ALBERT Fine-Tuning](https://colab.research.google.com/drive/1U_8fyQBl_xDiTgfH_U48b41Gt_gARCGQ?usp=sharing)
  + Was able to fine-tune the model with available resources to the expectation due to the `Parameter-Efficient Tuning (PET)` architecture of the Gemini base model.



