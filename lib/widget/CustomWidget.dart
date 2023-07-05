// ignore_for_file: file_names, prefer_const_constructors,, prefer_interpolation_to_compose_strings

part of '../header.dart';

class CustomWidget {
  radiusVal(radius) => Radius.circular(radius);

  appBarTitle(
      {required context, required title, required color, backForm = false}) {
    return AppBar(
      backgroundColor: color,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          if (backForm) {
            alert.alertConfirmBack(
              context: context,
              message: "Yakin untuk kembali? semua perubahaan akan hilang",
              onBack: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            );
          } else {
            Navigator.pop(context);
          }
        },
        icon: Icon(Icons.arrow_back_ios_new_rounded, color: defWhite),
      ),
      title: Text(
        title,
        style: textStyling.styleText5(global.getWidth(context) / 25, defWhite),
      ),
    );
  }

  bgAppbar(context) {
    return Positioned(
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(top: kToolbarHeight, left: 20, right: 20),
            height: kToolbarHeight * 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [defGreenDark, defGreenDark2, defGreenDark3],
              ),
            ),
          ),
        ],
      ),
    );
  }

  getBottomApp({required context, required action}) {
    return Container(
      width: global.getWidth(context),
      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: decorationGradient3Color(
          Colors.lightBlue, defBlue, 0.0, 0.0, 50.0, 50.0),
      child: ListTile(
        title: Text(
          "Versi " + appVersion + " ©2022 Central Developer",
          textAlign: TextAlign.center,
          style: textStyling.styleText6(14, defWhite),
        ),
        trailing: IconButton(
          onPressed: () {
            if (action == 'pop') Navigator.pop(context);
            if (action == 'logout') alert.alertLogout(context);
          },
          icon: action == 'pop'
              ? Icon(Icons.arrow_back_ios, color: defWhite)
              : Icon(Icons.logout, color: Colors.red),
        ),
      ),
    );
  }

  getBottomApp2({required context, required action}) {
    return Container(
      width: global.getWidth(context),
      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: decorationGradient3Color(
          Colors.lightBlue, defBlue, 0.0, 0.0, 50.0, 0.0),
      child: ListTile(
        title: Text(
          "Versi " + appVersion + " ©2023 Central Developer",
          textAlign: TextAlign.center,
          style: textStyling.styleText6(14, defWhite),
        ),
        trailing: IconButton(
          onPressed: () {
            if (action == 'pop') Navigator.pop(context);
            if (action == 'logout') alert.alertLogout(context);
          },
          icon: action == 'pop'
              ? Icon(Icons.arrow_back_ios, color: defWhite)
              : Icon(Icons.logout, color: Colors.red),
        ),
      ),
    );
  }

  getWidgetMenu2(
      {required context,
      routeName,
      title,
      color,
      icon,
      colorIcon,
      menuCode,
      image}) {
    return GestureDetector(
      onTap: () {
        if (routeName == 'back') {
          Navigator.pop(context);
        } else {
          Navigator.pushNamed(context, routeName);
        }
      },
      child: Container(
        decoration: decCont(defWhite, 20, 20, 20, 20),
        margin: EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 5),
        height: kToolbarHeight + 30,
        width: global.getWidth(context),
        child: Row(
          children: [
            Container(
              height: kToolbarHeight + 30,
              width: 70,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: image, fit: BoxFit.contain, scale: 0.5),
                color: color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
            ),
            Spacer(),
            Text(title,
                textAlign: TextAlign.center,
                style: textStyling.nunitoBold(16, colorIcon)),
            Spacer(),
          ],
        ),
      ),
    );
  }

  getWidgetMenu3(
      {required context, routeName, title, color, icon, colorIcon, menuCode}) {
    return GestureDetector(
      onTap: () {
        if (routeName == 'back') {
          Navigator.pop(context);
        } else {
          Navigator.pushNamed(context, routeName);
        }
      },
      child: Container(
        decoration: decCont(defWhite, 20, 20, 20, 20),
        margin: EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 5),
        height: kToolbarHeight + 30,
        width: global.getWidth(context),
        child: Row(
          children: [
            Container(
              height: kToolbarHeight + 30,
              width: 70,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Icon(icon, color: defWhite, size: 30),
            ),
            Spacer(),
            Text(title,
                textAlign: TextAlign.center,
                style: textStyling.nunitoBold(16, colorIcon)),
            Spacer(),
          ],
        ),
      ),
    );
  }

  decorationContainer1(color, radius) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(radiusVal(radius)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  decorationContainer2(color, radius) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(radiusVal(radius)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  decorationContainerGradient(color1, color2, radius) {
    return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color1, color2]),
      borderRadius: BorderRadius.all(radiusVal(radius)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  decorationGradient3Color(color1, color2, bl, br, tl, tr) {
    return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color1, color2]),
      borderRadius: BorderRadius.only(
        bottomLeft: radiusVal(bl),
        topLeft: radiusVal(tl),
        topRight: radiusVal(tr),
        bottomRight: radiusVal(br),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  decorationGradient4Color(color1, color2, color3, bl, br, tl, tr) {
    return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color1, color2, color3]),
      borderRadius: BorderRadius.only(
        bottomLeft: radiusVal(bl),
        topLeft: radiusVal(tl),
        topRight: radiusVal(tr),
        bottomRight: radiusVal(br),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  decCont(color, double radiusBl, double radiusBr, double radiusTl,
      double radiusTr) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        bottomLeft: radiusVal(radiusBl),
        bottomRight: radiusVal(radiusBr),
        topLeft: radiusVal(radiusTl),
        topRight: radiusVal(radiusTr),
      ),
    );
  }

  decCont2(color, double radiusBl, double radiusBr, double radiusTl,
      double radiusTr) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        bottomLeft: radiusVal(radiusBl),
        bottomRight: radiusVal(radiusBr),
        topLeft: radiusVal(radiusTl),
        topRight: radiusVal(radiusTr),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  decCont3(color, double radiusBl, double radiusBr, double radiusTl,
      double radiusTr) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        bottomLeft: radiusVal(radiusBl),
        bottomRight: radiusVal(radiusBr),
        topLeft: radiusVal(radiusTl),
        topRight: radiusVal(radiusTr),
      ),
      boxShadow: const [
        BoxShadow(
          color: Colors.black,
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 3),
        ),
      ],
    );
  }

  textInputDecoration(name, icon, colors) {
    return InputDecoration(
      prefixIcon: icon != null ? Icon(icon, color: colors) : null,
      labelText: name,
      labelStyle: TextStyle(color: defBlue),
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
    );
  }

  textInputDecoration2(name, icon, colors) {
    return InputDecoration(
      prefixIcon: icon != null ? Icon(icon, color: colors) : null,
      hintText: name,
      labelStyle: TextStyle(color: defBlue),
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
    );
  }

  getChoicePopUp(context) {
    return {'Legenda', 'Logout'}.map((String choice) {
      return PopupMenuItem<String>(
        value: choice,
        child: Row(
          children: [
            Icon(
              choice == "Legenda" ? Icons.info_rounded : Icons.logout,
              color: choice == "Legenda" ? defBlue : defRed,
            ),
            Text("  $choice")
          ],
        ),
      );
    }).toList();
  }

  getImageBgSugar(context) {
    return Positioned(
      top: kToolbarHeight * 2,
      bottom: 0,
      left: 0,
      right: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.only(left: global.getWidth(context) / 2),
            height: kToolbarHeight * 4,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/ic1bg.png")),
            ),
          )
        ],
      ),
    );
  }
}
