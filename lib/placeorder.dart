import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlaceOrderScreen extends StatefulWidget {
  final int price;
  const PlaceOrderScreen({super.key, required this.price});

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void _openCheckout(int price) {
    var options = {
      'key': 'rzp_test_j3dYWKRUu4qxU8', // Your Razorpay Test Key
      'amount': price * 100,
      'name': 'Takneeki Tshirts',
      'description': 'T-Shirt Purchase',
      'prefill': {
        'contact': '9999999999',
        'email': 'test@example.com',
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Checkout Error: $e');
    }
  }

   Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    final paymentId = response.paymentId ?? 'unknown';

    // ✅ Save payment info to Firestore
    await FirebaseFirestore.instance.collection('transactions').add({
      'paymentId': paymentId,
      'amount': widget.price,
      'email': 'test@example.com',
      'contact': '9999999999',
      'status': 'success',
      'timestamp': Timestamp.now(),
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("✅ Payment Successful: $paymentId")),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) async {
  try {
    await FirebaseFirestore.instance.collection('transactions').add({
      'paymentId': 'N/A', // No ID generated on failure
      'errorCode': response.code.toString(),
      'amount': widget.price,
      'status': 'failed',
      'reason': response.message ?? 'User cancelled or unknown error',
      'timestamp': Timestamp.now(),
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("❌ Payment Failed: ${response.message}")),
    );
  } catch (e) {
    debugPrint("🔥 Firestore error while saving failed transaction: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("❌ Could not log failed transaction")),
    );
  }
}


  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("External Wallet: ${response.walletName}")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Place Order")),
      body: Center(
        child: ElevatedButton(
          
          onPressed: () => _openCheckout(widget.price),
          child: Text("Pay ₹${widget.price}"),
        ),
      ),
    );
  }
}