include ../_scripts/Makefile

# use run_sample_worker to start the worker process that handles the trigger
run_sample_worker:
	cd ./sample-workflows && go run ./internal/greeter/worker

# use run_sample_trigger to trigger the workflow
run_sample_trigger:
	cd ./sample-workflows && go run ./internal/greeter/starter
