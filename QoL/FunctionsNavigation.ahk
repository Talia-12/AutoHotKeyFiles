moveVirtualDesktop(direction)
{
	if (direction = "LEFT")
	{
		Send ^#{Left}
	}
	else
	{
		Send ^#{Right}
	}
}