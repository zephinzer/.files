package app

import (
	"fmt"
	"time"

	"go.temporal.io/sdk/workflow"
)

const GreetingTaskQueue = "greeting_task_queue"

func ComposeGreeting(name string) (string, error) {
	<-time.After(time.Second * 15)
	return fmt.Sprintf("hello %s", name), nil
}

func GreetingWorkflow(ctx workflow.Context, name string) (string, error) {
	options := workflow.ActivityOptions{
		StartToCloseTimeout: time.Second * 60,
		HeartbeatTimeout:    time.Second * 20,
	}
	ctx = workflow.WithActivityOptions(ctx, options)
	var result string
	activity := workflow.ExecuteActivity(ctx, ComposeGreeting, name)
	err := activity.Get(ctx, &result)
	return result, err
}
