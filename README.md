# Uncertainty-Aware Auto-Scaling for GPU Servers Using LLM Decision Agents

CP493 Directed Research Project, Wilfrid Laurier University, Fall 2026
Student: Udai Chopra | Supervisor: Dr. Mustafa Daraghmeh

## Overview

AI services such as LLM chatbots run on expensive GPU servers, and demand for them changes constantly.
Running too few servers causes slow responses, while running too many wastes money on idle GPUs.

Existing auto-scalers either react after servers are already busy, trust a single demand forecast,
or add a fixed safety margin that does not adapt. This project explores whether an LLM decision agent
can choose the safety margin adaptively and learn from its own decisions.

## How the Framework Works

Each simulated hour, the framework runs one loop:

1. **Predict:** an ML model forecasts a range of future GPU demand, not a single value.
2. **Decide:** an LLM decision agent chooses how cautious to be (for example, 80%, 90% or 99% safe).
3. **Check:** a safety check turns that choice into a valid number of GPU servers.
4. **Observe:** a simulator replays the real next hour from the trace.
5. **Score:** the decision is scored, with a large penalty for running short of GPUs and a smaller penalty for idle GPUs.
6. **Learn:** the score feeds back into the LLM agent (memory and reflection) and into the forecaster (recalibration and retraining).

## Research Questions

- **RQ1:** Does an LLM decision agent that adapts the safety margin give a better trade-off between SLA violations and GPU cost than fixed-margin and single-forecast auto-scaling?
- **RQ2:** How does decision lead time (1, 2 or 3 hours ahead) affect the performance of each approach?
- **RQ3:** Does learning from outcomes improve the agent's decisions over time, compared with a reinforcement learning agent without an LLM?

## Methods Compared

- Reactive auto-scaling (based on the last hour's demand)
- The GPU count Alibaba actually used
- Single-value forecast
- Single-value forecast plus a fixed 20% buffer
- Forecast plus a fixed uncertainty margin
- Reinforcement learning agent without an LLM
- The proposed LLM decision agent
- Best possible allocation in hindsight (upper bound)

## Data

This project uses the Alibaba **cluster-trace-v2026-maas** dataset, specifically `app_metrics.csv`:
one week of hourly LLM serving data per application, including normalized request rate, input and
output token sizes, GPU count, and response latency.

- Source: https://github.com/alibaba/clusterdata
- The data is not stored in this repository.
- Please cite the original paper, "Model-as-a-Service in the Wild" (USENIX ATC '26), when using this dataset.

## Status

This project is in progress. Setup instructions, code and results will be added as the work develops.
