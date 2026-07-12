# home/discord/default.nix
{ nixcord, ... }:
{
  imports = [ nixcord.homeModules.nixcord ];

  programs.nixcord = {
    enable = true;

    discord.vencord.enable = true;

    config = {
      useQuickCss = true;
      themeLinks = [
        "https://raw.githubusercontent.com/rose-pine/discord/ba558b54e432efdc7078d89b3da1fd71309079e4/dist/rose-pine.css"
      ];

      plugins = {
        accountPanelServerProfile.enable = true;
        alwaysExpandRoles.enable = true;
        alwaysTrust.enable = true;
        betterGifPicker.enable = true;
        betterUploadButton.enable = true;
        callTimer.enable = true;
        characterCounter.enable = true;
        clearUrls.enable = true;
        copyFileContents.enable = true;
        copyUserUrls.enable = true;
        decor.enable = true;
        disableCallIdle.enable = true;
        favoriteEmojiFirst.enable = true;
        favoriteGifSearch.enable = true;
        fixImagesQuality.enable = true;
        fixYoutubeEmbeds.enable = true;
        friendInvites.enable = true;
        fullSearchContext.enable = true;
        fullUserInChatbox.enable = true;
        gifPaste.enable = true;
        greetStickerPicker.enable = true;
        iLoveSpam.enable = true;
        imageFilename.enable = true;
        imageZoom.enable = true;
        ircColors.enable = true;
        mentionAvatars.enable = true;
        noUnblockToJump.enable = true;
        onePingPerDm.enable = true;
        petpet.enable = true;
        pinDms.enable = true;
        platformIndicators.enable = true;
        relationshipNotifier.enable = true;
        reviewDb.enable = true;
        roleColorEverywhere.enable = true;
        shikiCodeblocks.enable = true;
        showConnections.enable = true;
        showHiddenChannels.enable = true;
        showMeYourName.enable = true;
        sortFriendRequests.enable = true;
        typingIndicator.enable = true;
        typingTweaks.enable = true;
        unlockedAvatarZoom.enable = true;
        userMessagesPronouns.enable = true;
        usrbg.enable = true;
        userVoiceShow.enable = true;
        validReply.enable = true;
        validUser.enable = true;
        vcNarrator.enable = true;
        vencordToolbox.enable = true;
        viewIcons.enable = true;
        volumeBooster.enable = true;
        whoReacted.enable = true;
        youtubeAdblock.enable = true;
        hideMedia.enable = true;
        fakeNitro.enable = true;
        messageLogger = {
          enable = true;
          ignoreSelf = true;
        };
        showHiddenThings.enable = true;
        alwaysAnimate.enable = true;
        crashHandler.enable = true;
      };
    };
  };
}
