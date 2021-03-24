package main

import (
	"context"
	"fmt"
	"sample-workflows/internal/greeter/app"

	"go.temporal.io/sdk/client"
)

func main() {
	c, err := client.NewClient(client.Options{
		HostPort: "localhost:7233",
	})
	if err != nil {
		panic(err)
	}
	defer c.Close()
	options := client.StartWorkflowOptions{
		ID:        "greeter-workflow",
		TaskQueue: app.GreetingTaskQueue,
	}
	workflowExecution, err := c.ExecuteWorkflow(context.Background(), options, app.GreetingWorkflow, "joseph")
	if err != nil {
		panic(err)
	}
	var workflowResult string
	err = workflowExecution.Get(context.Background(), &workflowResult)
	if err != nil {
		panic(err)
	}
	fmt.Printf("workflow id: %s\n", workflowExecution.GetID())
	fmt.Printf("run id     : %s\n", workflowExecution.GetRunID())
	fmt.Printf("result     : %s\n", workflowResult)
}
