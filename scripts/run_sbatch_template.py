import argparse
import subprocess
import os

TEMPLATE = """





{CMD}

"""


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--cmd")
    parser.add_argument("--cmds_file", default="")
    parser.add_argument("--cmds_sep", default="\n")
    parser.add_argument("--template_file", default="")
    parser.add_argument("--limit", default=None, type=int)
    parser.add_argument("--offset", default=0, type=int)
    parser.add_argument("--emulate", action="store_true")
    args = parser.parse_args()

    if args.cmds_file:
        with open(args.cmds_file, "r") as fp:
            cmds_txt = fp.read()
        cmds = cmds_txt.split(args.cmds_sep)
    else:
        cmds = [args.cmd]

    if args.limit is not None:
        cmds = cmds[args.offset:args.limit]

    if args.template_file:
        with open(args.template_file) as fp:
            TEMPLATE = fp.read()

    for cmd in cmds:
        output_file_num = 0
        output_file = f"sbatch_files/run_{output_file_num}.sbatch"
        while os.path.exists(output_file):
            output_file_num += 1
            output_file = f"sbatch_files/run_{output_file_num}.sbatch"

        exec_args = ["sbatch", output_file]
        if not args.emulate:
            with open(output_file, "w") as fp:
                fp.write(TEMPLATE.replace("{CMD}", cmd))

            subprocess.run(exec_args, check=False)
        print("Executed:", exec_args)


if __name__ == "__main__":
    main()
