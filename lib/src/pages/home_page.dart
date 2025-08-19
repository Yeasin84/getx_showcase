import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/counter_controller.dart';
import '../controllers/theme_controller.dart';
import '../app_routes.dart';
import '../widgets/primary_button.dart';

class HomePage extends GetView<CounterController> {
  const HomePage({super.key});

  // GetView gives us `controller` via Get.find<CounterController>()
  @override
  CounterController get controller => Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Showcase'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Toggle theme',
            onPressed: themeCtrl.toggle,
            icon: const Icon(Icons.brightness_6_rounded),
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Icon(Icons.flutter_dash_rounded, size: 48, color: cs.primary),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        'Elegant mini app powered by GetX',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Reactive counter (Obx)
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cs.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Reactive Counter', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Obx(() {
                    return Text(
                      '${controller.count.value}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    );
                  }),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          label: 'Increment',
                          icon: Icons.add_rounded,
                          onPressed: () {
                            controller.increment();
                            // UX micro‑feedback
                            HapticFeedback.selectionClick();
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: controller.decrement,
                          icon: const Icon(Icons.remove_rounded),
                          label: const Text('Decrement'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Non‑reactive builder section
            GetBuilder<CounterController>(
              builder: (_) => ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                tileColor: cs.surfaceContainerLow,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                title: const Text('Non‑reactive area (GetBuilder)'),
                subtitle: Text('Manual taps: ${controller.taps}'),
                trailing: IconButton(
                  onPressed: controller.registerTap,
                  icon: const Icon(Icons.touch_app_rounded),
                  tooltip: 'Register tap (update)',
                ),
              ),
            ),

            const Spacer(),

            // Action row
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    label: 'Open Details',
                    icon: Icons.arrow_forward_rounded,
                    onPressed: () => Get.toNamed(AppRoutes.details),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.snackbar(
                        'Saved',
                        'Your changes were synced.',
                        icon: const Icon(Icons.check_circle_outline_rounded),
                        forwardAnimationCurve: Curves.easeOutCubic,
                        duration: const Duration(milliseconds: 1600),
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      );
                    },
                    icon: const Icon(Icons.notifications_active_outlined),
                    label: const Text('Snackbar'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Get.bottomSheet(
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 40,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: cs.outlineVariant,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                ListTile(
                                  leading: const Icon(Icons.share_rounded),
                                  title: const Text('Share'),
                                  onTap: () => Get.back(result: 'share'),
                                ),
                                ListTile(
                                  leading: const Icon(Icons.bookmark_outline_rounded),
                                  title: const Text('Bookmark'),
                                  onTap: () => Get.back(result: 'bookmark'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.expand_less_rounded),
                    label: const Text('Bottom Sheet'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Get.dialog(
                        AlertDialog(
                          title: const Text('Confirm'),
                          content: const Text('Proceed with the action?'),
                          actions: [
                            TextButton(onPressed: Get.back, child: const Text('Cancel')),
                            FilledButton(
                              onPressed: () => Get.back(result: true),
                              child: const Text('Yes'),
                            ),
                          ],
                        ),
                        barrierDismissible: true,
                      );
                    },
                    icon: const Icon(Icons.chat_bubble_outline_rounded),
                    label: const Text('Dialog'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
