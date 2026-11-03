# Forecasting

- Use cases: occupancy and demand, no-show risk, inventory reorder, staffing load, revenue.
- Baselines: last value, seasonal naive (same weekday last year/week), moving average.
- Evaluation: rolling-origin backtest; MAE/MAPE/WAPE; check bias; report by segment and peak periods.
- Inputs: calendar, events and holidays, pricing, lead time, channel; avoid leakage from future-known data.
- Output as ranges, with a manual override and a log of overrides.
- Retrain cadence and drift trigger documented.
