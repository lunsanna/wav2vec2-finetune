#!/bin/bash
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=4
#SBATCH -p gpu-nvlink,dgx-spa
#SBATCH --time=2-15:20:00
#SBATCH --job-name=digitala_fi
#SBATCH --mem=10G
#SBATCH --output=output.out
#SBATCH --error=errors.err

module load anaconda
module load cuda 
source activate w2v2

# torchrun --nproc_per_node=1 finetune.py --lang=fi
srun python -u finetune.py --lang=fi

# watch -n 5 nvidia-smi >> gpu_usage.txt
# srun python -u finetune.py --lang=fi

# srun python -u -m torch.distributed.launch \
    # --nproc_per_node 4 finetune.py --lang=fi