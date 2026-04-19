import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  String email = "";
  String newPassword = "";
  String confirmPassword = "";

  void resetPassword() {
    if (newPassword != confirmPassword) {
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          content: Text("Mật khẩu xác nhận không khớp"),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (_) => const AlertDialog(
        content: Text("Khôi phục mật khẩu thành công"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reset Password")),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.lock_reset,
                    size: 60, color: Colors.blue),
                const SizedBox(height: 10),

                const Text(
                  "Reset Password",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                // EMAIL
                TextField(
                  onChanged: (v) => email = v,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // NEW PASSWORD
                TextField(
                  obscureText: true,
                  onChanged: (v) => newPassword = v,
                  decoration: InputDecoration(
                    labelText: "New Password",
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // CONFIRM PASSWORD
                TextField(
                  obscureText: true,
                  onChanged: (v) => confirmPassword = v,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    prefixIcon: const Icon(Icons.lock_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: resetPassword,
                    icon: const Icon(Icons.refresh),
                    label: const Text("Reset"),
                  ),
                ),

                TextButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text("Back"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}