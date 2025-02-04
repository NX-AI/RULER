from transformers import AutoModelForCausalLM
import torch

mod = AutoModelForCausalLM.from_pretrained('NX-AI/xLSTM-7b', device_map="auto")
toks = torch.ones([1, 256000], dtype=torch.int32, device='cuda')

print(mod(toks))
