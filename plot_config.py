import matplotlib as mpl

# model_colors = {
#     "xLSTM-7b": mpl.colormaps["tab10"].colors[0],
#     "xLSTM-7b-longctx": mpl.colormaps["tab10"].colors[1],
#     "llama-2-7b": mpl.colormaps["tab10"].colors[2],
#     "llama3.1-8b": mpl.colormaps["tab10"].colors[3],
#     # "ministral8b": mpl.colormaps["tab10"].colors[5],
#     # "codestral_mamba": mpl.colormaps["tab10"].colors[6],
#     "falcon-mamba-7b": mpl.colormaps["tab10"].colors[4],
#     # "zamba2": mpl.colormaps["tab10"].colors[7],
# }


xlstm_colors = {
    "llama3": "#165b89ff",
    "llama2": "#80a8b3ff",
    "xlstm2": "#cc4391ff",
    "xlstm": "#861657ff",
    "codestral_mamba": "#d08814ff",
    "falcon_mamba": "#ffd449ff",
    "RWKV4": "#145815ff",
}


model_colors = {
    "xLSTM-7b": xlstm_colors["xlstm"],
    "xLSTM-7b-longctx": xlstm_colors["xlstm2"],
    "llama-2-7b": xlstm_colors["llama2"],
    "llama3.1-8b": xlstm_colors["llama3"],
    # "ministral8b": mpl.colormaps["tab10"].colors[5],
    # "codestral_mamba": mpl.colormaps["tab10"].colors[6],
    "falcon-mamba-7b": xlstm_colors["falcon_mamba"],
    "codestral-mamba-7b": xlstm_colors["codestral_mamba"],
    # "zamba2": mpl.colormaps["tab10"].colors[7],
}

model_labels = {
    "xLSTM-7b": "xLSTM 7B",
    "xLSTM-7b-longctx": "xLSTM 7B ctx32k",
    "llama-2-7b": "Llama 2 7B",
    "llama3.1-8b": "Llama 3 8B",
    # "ministral8b": mpl.colormaps["tab10"].colors[5],
    # "codestral_mamba": mpl.colormaps["tab10"].colors[6],
    "falcon-mamba-7b": "FalconMamba 7B",
    "codestral-mamba-7b": "CodestralMamba 7B",
    "xLSTM-7b-short-nh4": "xLSTM 7B shorttrain NH=4",
    "xLSTM-7b-short-nh8": "xLSTM 7B shorttrain NH=8",
    "xLSTM-7b-short-nh16": "xLSTM 7B shorttrain NH=16",
    "xLSTM-7b-short-nh32": "xLSTM 7B shorttrain NH=32",
    "xLSTM-7b-short-nh8-noig": "xLSTM 7B shorttrain NH=8 igfix=-10",
    "xLSTM-7b-short-nh8-noig0": "xLSTM 7B shorttrain NH=8 igfix=0",
}

# "mlstm_simple": "",
#     "xlstm": "xLSTM 7",
#     "llama2": "Llama 2 7B",
#     "llama3": "Llama 3 8B",
#     "ministral8b": "Ministral8B",
#     "codestral_mamba": "CodestralMamba (Mamba 2) 7B",
#     "falcon_mamba": "FalconMamba (Mamba 1) 7B",
#     "zamba2": "Zamba2",

# linestyle_mapping = {
#     "__tcm__": {"linestyle": "--", "label": ""},
# }

# style_dict = {
#     "mlstm_simple": {
#         "color": model_colors["mlstm_simple"],
#         "label": model_labels["mlstm_simple"],
#     },
#     "xlstm": {"color": xlstm_colors["xlstm"], "label": model_labels["xlstm"]},
#     "llama2": {"color": xlstm_colors["llama2"], "label": model_labels["llama2"]},
#     "llama3": {"color": xlstm_colors["llama3"], "label": model_labels["llama3"]},
#     "ministral8b": {
#         "color": model_colors["ministral8b"],
#         "label": model_labels["ministral8b"],
#     },
#     "codestral_mamba": {
#         "color": xlstm_colors["codestral_mamba"],
#         "label": model_labels["codestral_mamba"],
#     },
#     "falcon_mamba": {
#         "color": xlstm_colors["falcon_mamba"],
#         "label": model_labels["falcon_mamba"],
#     },
#     "zamba2": {"color": model_colors["zamba2"], "label": model_labels["zamba2"]},
# }
