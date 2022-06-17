.PHONY=help

help:  ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST) | sort

###
# Run section
###
clean: ## Clean our project build tmp files
	flutter clean && flutter pub get
run: ## Run any app with flavor name. e.g. make run base
	flutter run
xcode: ## Open xcode project
	open -a Xcode.app ios/
gitForce: ## Force git push
	git add .
	git commit --amend --no-edit
	git push -f

run-ios: ## Open xcode from build run
	open ios/Runner.xcworkspace


###
# Build section
###
mobx: ## BuildRunner mobx
	flutter packages pub run build_runner build --delete-conflicting-outputs 
build-apk: ## Build an APK of any app with flavor name. e.g. make build base
	flutter packages pub run build_runner build --delete-conflicting-outputs
	flutter clean
	flutter pub get
	flutter build apk --release
build-appbundle: ## Build an APK of any app with flavor name. e.g. make build base
	flutter build appbundle --release
build-ios: ## Build an APK of any app with flavor name. e.g. make build base
	flutter build ios --release

###
# Dependencies section
###
dependencies: ## Install all dependencies

	flutter pub get


###
# Tests section
###
test: ## Run all tests
	flutter test