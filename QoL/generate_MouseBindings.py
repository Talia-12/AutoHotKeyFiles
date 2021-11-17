import json

def main():
	
	totalString = "";
 
	with open("MouseBindingsSettings.json") as mouseBindingsSettingsFile:
		mouseBindingsSettings = json.load(mouseBindingsSettingsFile)	
  
		for i in range(1, 13):
			buttoniString = f"""
; button {i}
WinGet, procName, ProcessName, A

switch currentMode
{{
"""
			for mode, modeActions in mouseBindingsSettings.items():
				if (mode == "default"):
					continue; # covering default at the end with its own case

				if (len(modeActions[str(i)])):
					buttoniString = addAction(buttoniString, modeActions["name"], mode, modeActions[str(i)])
					
			
			defaultActions = mouseBindingsSettings["default"][str(i)]

			if (len(defaultActions) > 1): # different default actions in different programs
				buttoniString += """

	default:
		switch procName
		{
"""
				for action, actionList in defaultActions:
					if action == "default":
						continue
					
					buttoniString += f"\n			case {action}: {actionList[0]}\n		return"


			else:
				buttoniString += f"""

	default:
		{defaultActions["default"][0]}
"""

			buttoniString += "}"

			totalString += f"onButton{i}(currentMode)\n{{\n{buttoniString}\n}}\n\n"

	with open("MouseBindingsTemplate.ahk") as template:
		with open("MouseBindings.ahk", "w") as output:
			output.write(template.read())
			output.write("\n")
			output.write(totalString)
   

def addAction(buttoniString, modeName, modeNum, actions):
	if (len(actions) > 1 or "default" not in actions): # different default actions in different programs
		buttoniString += f"""

	case {modeNum}: ; {modeName}
		switch procName
		{{
"""
		for action, actionList in actions.items():
			if action == "default":
				continue
					
			buttoniString += f"\n			case \"{action}\": {actionList[0]}\n		return"

		if "default" in actions:
			buttoniString += f"""

	default:
		{actions["default"][0]}
"""
		buttoniString += "\n}"

	if "default" in actions:
		buttoniString += f"""

	case {modeNum}: ; {modeName}
		{actions["default"][0]}
		return
"""
	
	return buttoniString



if __name__ == "__main__":
	main()